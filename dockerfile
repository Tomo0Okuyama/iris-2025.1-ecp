FROM containers.intersystems.com/intersystems/iris-arm64:2025.1

USER ${ISC_PACKAGE_MGRUSER}
COPY iris.script /tmp/iris.script
COPY iris.key ${ISC_PACKAGE_INSTALLDIR}/mgr/iris.key

RUN iris start IRIS \
    && iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
