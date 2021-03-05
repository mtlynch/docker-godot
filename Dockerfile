FROM debian:stretch-slim AS zip_downloader
LABEL maintainer="Michael Lynch <michael@mtlynch.io>"

ARG GODOT_VERSION="3.2.3"
ARG GODOT_BINARY="Godot_v${GODOT_VERSION}-stable_linux_headless.64"
ARG GODOT_ZIP="${GODOT_BINARY}.zip"
ARG GODOT_RELEASE="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_ZIP}"
ARG GODOT_TEMPLATES_ZIP="Godot_v${GODOT_VERSION}-stable_export_templates.tpz"
ARG GODOT_TEMPLATES_RELEASE="https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_TEMPLATES_ZIP}"
ARG GODOT_DIR="/godot"

RUN apt-get update
RUN apt-get install -y \
      wget \
      unzip

RUN mkdir "$GODOT_DIR"
WORKDIR "$GODOT_DIR"

RUN wget --no-verbose "$GODOT_RELEASE" && \
      unzip "$GODOT_ZIP" && \
      mv "${GODOT_BINARY}" ./godot

RUN wget --no-verbose "$GODOT_TEMPLATES_RELEASE" && \
      unzip "$GODOT_TEMPLATES_ZIP"

FROM debian:stretch-slim

ARG GODOT_VERSION="3.2.3"

COPY --from=zip_downloader /godot/godot "/bin/godot"
COPY --from=zip_downloader /godot/templates "/root/.local/share/godot/templates/${GODOT_VERSION}.stable"

ENTRYPOINT ["/bin/godot"]
