FROM quay.io/operator-framework/ansible-operator:v1.4.0

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

RUN ansible-galaxy install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

RUN pip3 install --user paramiko && chmod -R ug+rwx ${HOME}/.local

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
