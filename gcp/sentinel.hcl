module "tfplan-functions" {
    source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
    source = "../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
    source = "../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "gcp-functions" {
    source = "./gcp-functions/gcp-functions.sentinel"
}

policy "enforce-mandatory-labels" {
    source = "./enforce-mandatory-labels.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-egress-firewall-destination-ranges" {
    source = "./restrict-egress-firewall-destination-ranges.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-gce-machine-type" {
    source = "./restrict-gce-machine-type.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-gke-clusters" {
    source = "./restrict-gke-clusters.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-ingress-firewall-source-ranges" {
    source = "./restrict-ingress-firewall-source-ranges.sentinel"
    enforcement_level = "advisory"
}

policy "gcp-cis-4.3-compute-ensure-oslogin-is-enabled-for-a-project" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.3-compute-ensure-oslogin-is-enabled-for-a-project/gcp-cis-4.3-compute-ensure-oslogin-is-enabled-for-a-project.sentinel"
    enforcement_level = "advisory"
}

policy "gcp-cis-4.4-compute-enable-connecting-to-serial-ports-is-not-enabled-for-vm-instance" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.4-compute-enable-connecting-to-serial-ports-is-not-enabled-for-vm-instance/gcp-cis-4.4-compute-enable-connecting-to-serial-ports-is-not-enabled-for-vm-instance.sentinel"
    enforcement_level = "advisory"
}

policy "gcp-cis-4.5-compute-ensure-that-ip-forwarding-is-not-enabled-on-instances" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.5-compute-ensure-that-ip-forwarding-is-not-enabled-on-instances/gcp-cis-4.5-compute-ensure-that-ip-forwarding-is-not-enabled-on-instances.sentinel"
    enforcement_level = "advisory"
}