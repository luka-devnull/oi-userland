#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2017 Alexander Pyhalov
#

include ../../../make-rules/shared-macros.mk

COMPONENT_NAME =	pg_repack
COMPONENT_VERSION =	1.4.4
COMPONENT_SUMMARY =	pg_repack - utility to reorganize PostgreSQL tables on-line
COMPONENT_SRC =	$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE =	$(COMPONENT_SRC).zip
COMPONENT_ARCHIVE_HASH = \
  sha256:64cfa166932903f3578aaa9e9bd227f557cf3596c6984c6c0538ec40d124f5be
COMPONENT_ARCHIVE_URL = \
  http://api.pgxn.org/dist/pg_repack/$(COMPONENT_VERSION)/$(COMPONENT_ARCHIVE)
COMPONENT_PROJECT_URL =	http://reorg.github.io/pg_repack/
COMPONENT_FMRI =	database/postgres-10/pg_repack
COMPONENT_CLASSIFICATION =	System/Databases
COMPONENT_LICENSE =	BSD
COMPONENT_LICENSE_FILE =	COPYRIGHT

PG_VERSION=	10
# Don't depend on host default pg_config
# Note, for PostgreSQL >= 9.6 $(PG_HOME)/bin contains 64-bit files
PATH=		$(PG_HOME)/bin:/usr/sbin:/usr/bin

include $(WS_MAKE_RULES)/prep.mk
include $(WS_MAKE_RULES)/justmake.mk
include $(WS_MAKE_RULES)/ips.mk

COMPONENT_BUILD_ENV	+=	USE_PGXS=0

build: $(BUILD_64)

install: $(INSTALL_64)

REQUIRED_PACKAGES += database/postgres-10/developer
REQUIRED_PACKAGES += database/postgres-10/library
REQUIRED_PACKAGES += system/library
