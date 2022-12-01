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


## Projects
policy "enforce-project-billing" {
    source = "./enforce-project-billing.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "enforce-project-naming-convention" {
    source = "./enforce-project-naming-convention.sentinel"
    enforcement_level = "hard-mandatory"
}


## Source of remote policies: https://github.com/hashicorp/terraform-foundational-policies-library/blob/master/cis/gcp/compute/README.md

## Compute Engine
policy "gcp-cis-4.2-compute-block-project-wide-ssh-keys-enabled-for-vm-instances" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.2-compute-block-project-wide-ssh-keys-enabled-for-vm-instances/gcp-cis-4.2-compute-block-project-wide-ssh-keys-enabled-for-vm-instances.sentinel"
    enforcement_level = "advisory"
}

policy "gcp-cis-4.3-compute-ensure-oslogin-is-enabled-for-a-project" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.3-compute-ensure-oslogin-is-enabled-for-a-project/gcp-cis-4.3-compute-ensure-oslogin-is-enabled-for-a-project.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "gcp-cis-4.4-compute-enable-connecting-to-serial-ports-is-not-enabled-for-vm-instance" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.4-compute-enable-connecting-to-serial-ports-is-not-enabled-for-vm-instance/gcp-cis-4.4-compute-enable-connecting-to-serial-ports-is-not-enabled-for-vm-instance.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "gcp-cis-4.5-compute-ensure-that-ip-forwarding-is-not-enabled-on-instances" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/compute/gcp-cis-4.5-compute-ensure-that-ip-forwarding-is-not-enabled-on-instances/gcp-cis-4.5-compute-ensure-that-ip-forwarding-is-not-enabled-on-instances.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "restrict-gce-machine-type" {
    source = "./restrict-gce-machine-type.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "enforce-compute-engine-description" {
    source = "./enforce-compute-engine-description.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "enforce-mandatory-labels" {
    source = "./enforce-mandatory-labels.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "enforce-compute-engine-hostname" {
    source = "./enforce-compute-engine-hostname.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "enforce-disable-guest-attributes" {
    source = "./disable-guest-attributes.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "restrict-gke-clusters" {
    source = "./restrict-gke-clusters.sentinel"
    enforcement_level = "advisory"
}
## Storage

policy "gcp-cis-5.1-storage-deny-anonymous-or-public-bucket-access" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/storage/gcp-cis-5.1-storage-deny-anonymous-or-public-bucket-access/gcp-cis-5.1-storage-deny-anonymous-or-public-bucket-access.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "gcp-cis-5.3-storage-bucket-logging-is-enabled" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/storage/gcp-cis-5.3-storage-bucket-logging-is-enabled/gcp-cis-5.3-storage-bucket-logging-is-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "enforce-uniform-bucket-level-access" {
    source = "./enforce-uniform-bucket-level-access.sentinel"
    enforcement_level = "hard-mandatory"
}

## Networking
/*
policy "gcp-cis-3.1-networking-deny-default-network-in-project" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.1-networking-deny-default-network-in-project/gcp-cis-3.1-networking-deny-default-network-in-project.sentinel"
  enforcement_level = "advisory"
}

policy "gcp-cis-3.3-networking-dnssec-is-enabled-for-cloud-dns" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.3-networking-dnssec-is-enabled-for-cloud-dns/gcp-cis-3.3-networking-dnssec-is-enabled-for-cloud-dns.sentinel"
  enforcement_level = "advisory"
}

policy "gcp-cis-3.4-networking-dnssec-rsasha1-is-not-key-signing-key" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.4-networking-dnssec-rsasha1-is-not-key-signing-key/gcp-cis-3.4-networking-dnssec-rsasha1-is-not-key-signing-key.sentinel"
  enforcement_level = "advisory"
}

policy "gcp-cis-3.5-networking-dnssec-rsasha1-is-not-used-for-zone-signing-key" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.5-networking-dnssec-rsasha1-is-not-used-for-zone-signing-key/gcp-cis-3.5-networking-dnssec-rsasha1-is-not-used-for-zone-signing-key.sentinel"
  enforcement_level = "advisory"
}

policy "gcp-cis-3.6-networking-ssh-is-restricted-from-internet" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.6-networking-ssh-is-restricted-from-internet/gcp-cis-3.6-networking-ssh-is-restricted-from-internet.sentinel"
  enforcement_level = "advisory"
}

policy "gcp-cis-3.7-networking-rdp-is-restricted-from-internet" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.7-networking-rdp-is-restricted-from-internet/gcp-cis-3.7-networking-rdp-is-restricted-from-internet.sentinel"
  enforcement_level = "advisory"
}

policy "gcp-cis-3.8-networking-private-google-access-is-enabled-for-all-vpc-subnets" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.8-networking-private-google-access-is-enabled-for-all-vpc-subnets/gcp-cis-3.8-networking-private-google-access-is-enabled-for-all-vpc-subnets.sentinel"
  enforcement_level = "advisory"
}
policy "gcp-cis-3.8-networking-private-google-access-is-enabled-for-all-vpc-subnets" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/networking/gcp-cis-3.8-networking-private-google-access-is-enabled-for-all-vpc-subnets/gcp-cis-3.8-networking-private-google-access-is-enabled-for-all-vpc-subnets.sentinel"
  enforcement_level = "advisory"
}

policy "restrict-ingress-firewall-source-ranges" {
    source = "./restrict-ingress-firewall-source-ranges.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-egress-firewall-destination-ranges" {
    source = "./restrict-egress-firewall-destination-ranges.sentinel"
    enforcement_level = "advisory"
}

## Databases

policy "gcp-cis-6.1-databases-cloud-sql-databases-instance-requires-all-incoming-connections-to-use-ssl" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/databases/gcp-cis-6.1-databases-cloud-sql-databases-instance-requires-all-incoming-connections-to-use-ssl/gcp-cis-6.1-databases-cloud-sql-databases-instance-requires-all-incoming-connections-to-use-ssl.sentinel"
    enforcement_level = "advisory"
}

policy "gcp-cis-6.2-databases-cloud-sql-databases-instances-are-not-open-to-the-world" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/databases/gcp-cis-6.2-databases-cloud-sql-databases-instances-are-not-open-to-the-world/gcp-cis-6.2-databases-cloud-sql-databases-instances-are-not-open-to-the-world.sentinel"
    enforcement_level = "hard-mandatory"
}
*/