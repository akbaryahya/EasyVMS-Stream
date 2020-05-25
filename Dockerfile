FROM ubuntu:eoan
EXPOSE 8080
ENV DISPLAY :0

WORKDIR /root/wine

## We don't want any interaction from package installation during the docker image building.
ENV DEBIAN_FRONTEND noninteractive

# Set lang
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Setting up the wineprefix to force 32 bit architecture.
ENV WINEPREFIX /root/wine/.wine
ENV WINEARCH win32
ENV WINEDLLOVERRIDES "mscoree,mshtml=,oleaut32=n,msado15=n"

# We want the 32 bits version of wine allowing winetricks.
RUN dpkg --add-architecture i386

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    # We need software-properties-common to add ppas and gnupg2 to add repositories and their keys.
    software-properties-common gnupg2 wget curl \
    # We need supervisor for autorun
    supervisor \
    # We need tar for unzip file
    tar unzip p7zip \
    # We need x11vnc for show info pc
    x11vnc xdotool fluxbox tilda \
    # for stream here
    initramfs-tools libglu1 mpg123 ffmpeg cabextract zenity winbind xterm

# Download file what need!
# RUN wget http://www.yucvision.com/upload/file/EasyVMS.exe
COPY EasyVMS.exe /root/wine/EasyVMS.exe
RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | \
    tar -xzv -C /root/wine && \
    mv /root/wine/noVNC-1.1.0 /root/wine/novnc && \
    ln -s /root/wine/novnc/vnc_lite.html /root/wine/novnc/index.html
RUN wget -O - https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | \
    tar -xzv -C /root/wine/ && \
    mv /root/wine/websockify-0.9.0 /root/wine/novnc/utils/websockify

# mono
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
#    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono.list && \
#    apt-get update && apt-get install -y --no-install-recommends \
#    mono-complete
    
# wine
RUN wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
    echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ eoan main' | tee /etc/apt/sources.list.d/winehq.list && \
    apt-get update && apt-get install -y --no-install-recommends \
    winehq-devel xvfb

RUN curl -SL -k https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks  -o /usr/bin/winetricks && chmod a+x /usr/bin/winetricks

RUN xvfb-run sh -c "winetricks -q vb6run && wineserver --wait" && \
    xvfb-run sh -c "winetricks -q mdac28 && wineserver --wait" && \
    xvfb-run sh -c "winetricks -q jet40 && wineserver --wait"

# msvcrt or xvfb-run sh -c "wine regsvr32 /i msado15.dll"

RUN apt-get autoremove -y --purge software-properties-common && \
	apt-get autoremove -y --purge && \
	apt-get clean -y && \
	rm -rf /root/wine/.cache && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tool/ /root/wine/

COPY entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh

# Let script run after all done
ENTRYPOINT ["sh", "/etc/entrypoint.sh"]