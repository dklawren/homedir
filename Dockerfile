# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# This Source Code Form is "Incompatible With Secondary Licenses", as
# defined by the Mozilla Public License, v. 2.0.

FROM fedora:33

ENV USER dkl
ENV HOMEDIR /home/dkl/local-devel/homedir

# Packages
RUN dnf -y -q install ansible git sudo && dnf clean all

# Ansible
COPY . $HOMEDIR
WORKDIR $HOMEDIR
RUN cd $HOMEDIR && ansible-playbook local.yml
