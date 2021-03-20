


> Written with [StackEdit](https://stackedit.io/).
# postgresql-operator
This operator deploys postgresql running in virtual machines (VMs) on OpenShift Container Platform.

It's an Ansible based operator and uses Ansible's k8s modules to define infrastructure resources like VMs, storage, k8s services, etc.. and https://galaxy.ansible.com/geerlingguy/postgresql Ansible role to deploy and configure PostgreSQL on the VMs.

Details about Ansible based operators can be found on https://master.sdk.operatorframework.io/docs/building-operators/ansible/

To test this operator on your OpenShift 4.x cluster, you can define the following CatalogSource in your cluster and then install the operator from platform's OperatorHub interface.

    cat <<EOF | oc apply -f -
    apiVersion: operators.coreos.com/v1alpha1
    kind: CatalogSource
    metadata:
      name: korays-operators
      namespace: openshift-marketplace
    spec:
      sourceType: grpc
      image: quay.io/koray/korays-operator-catalog:1.0.0
      displayName: Korays Operators
      publisher: Koray Seremet
      updateStrategy:
        registryPoll: 
          interval: 60m
    EOF

