## TODO/Fix Items
Items that are work-in-progress, need improvement, security concerns, etc:

## Public Endpoint Hardening:
- Needs proper integartion with Route53, static DNS names, load-balancing, DDos protection (Cloudflare), etc.

## (Temporary) Public IP addresses
- Add checks to only update these (temporary) public IP addresses "if needed"... e.g.
```
$ terraform plan
...
Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected
this plan:

  # aws_instance.prometheus-primary has changed
  ~ resource "aws_instance" "prometheus-primary" {
        id                                   = "i-04e15fb54bb587ae4"
      ~ public_ip                            = "<OLD IP>" -> "<NEW IP>"
        tags                                 = {
            "Name" = "prometheus-federation-primary"
        }
        # (38 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }

  # aws_instance.prometheus-secondary has changed
  ~ resource "aws_instance" "prometheus-secondary" {
        id                                   = "i-0fd0b2c2753c3287e"
      ~ public_ip                            = "<OLD IP>" -> "<NEW IP>"
        tags                                 = {
            "Name" = "prometheus-federation-secondary"
        }
        # (38 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }
...
```
## `ansible_generate_inventory.bash`:
- Had some issues with this script not returning incorrect/inconsistant Public IPs from `terraform output` and `aws ec2 describe`
- Needs more testing/validation.  Or, better yet integrations with existing terraform, inventory, cdci, etc...

## `ansible_install_prometheus.yaml`: 
- Terraform does run this ansbile playbook, but it doesn't seem to work on the first run through...
- Add checks to only update the terraform to only run this ansible_playbook "if needed"... e.g.
```
$ terraform plan
...
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # null_resource.run_ansible_playbook is tainted, so must be replaced
-/+ resource "null_resource" "run_ansible_playbook" {
      ~ id = "3117538874020622644" -> (known after apply)
    }
...
```
- Needs more testing/validation.  Or, better yet integrations with existing terraform, inventory, cdci, etc...

## `/federate` end-point:
- Needs to include tls/ssl/https configs

## Additional: "Production Readiness Review" items:

**I. Infrastructure as Code (IaC) Enhancements**

* **Terraform Modules:**
    * Create reusable Terraform modules (in `terraform/modules/`) for:
        * Prometheus servers (instance creation, security groups).
        * Load balancers.
        * Route53 records.
* **Terraform State Management:**
    * Use a remote backend for Terraform state (e.g., AWS S3 with DynamoDB locking).
* **Infrastructure Testing:**
    * Implement testing with tools like:
        * **Terratest:** For Terraform code testing.
        * **Inspec or Serverspec:** For server state verification.

**II. Security Hardening**

* **Principle of Least Privilege:**
    * **IAM Roles:** Minimize IAM role permissions for EC2 instances.
    * **Ansible:** Ensure Ansible has only necessary permissions.
    * **Firewall Rules:** Strictly control access with security groups. If using a reverse proxy, limit access to the Prometheus ports and expose only the proxy ports.
* **Secrets Management:**
    * Avoid storing secrets in code/config files.
    * Use secure secrets management:
        * **AWS Secrets Manager**
        * **HashiCorp Vault**
    * **Terraform Integration:** Retrieve secrets and inject them into resources.
* **Vulnerability Scanning:**
    * Implement vulnerability scanning:
        * **Infrastructure:** AWS Inspector.
        * **Container Images:** Scan images in your CI/CD pipeline (if applicable).
* **Network Security:**
    * **VPC:** Use a Virtual Private Cloud (VPC) for isolation.
    * **Subnets:** Use appropriate subnets (public/private).
    * **Network ACLs:** Use Network Access Control Lists (NACLs).
* **Regular Security Audits:**
    * Conduct regular security audits.

**III. Observability and Monitoring**

* **Enhanced Prometheus Monitoring:**
    * **Node Exporter:** (Already used, which is good) Consider additional exporters:
        * **cAdvisor:** For container metrics (if using containers).
        * **Blackbox Exporter:** For external service probing.
    * **Service Discovery:**
        * Implement service discovery (e.g., AWS EC2, DNS) for dynamic environments.
    * **Federation Improvements:**
        * **Hierarchical Federation:** (Already used, ensure it's optimized)
        * **Centralized Monitoring:** Consider a centralized Prometheus server.
* **Grafana Integration:**
    * Create Grafana dashboards to visualize metrics.
    * **Dashboards as Code:** Manage dashboards as code (e.g., Terraform, Grafana API).
* **Logging:**
    * **Centralized Logging:**
        * **Loki**
        * **Elasticsearch, Fluentd, and Kibana (EFK stack)**
    * **Log Correlation:** Correlate logs with metrics and traces.
* **Tracing:**
    * **Tempo**
    * **Distributed Tracing:** Implement tracing to track requests.

**IV. Automation and CI/CD**

* **CI/CD Pipeline:**
    * Automate building, testing, and deploying.
    * **Tools:**
        * **GitHub Actions**
        * **Jenkins, CircleCI**
    * **Pipeline Stages:**
        * Code Quality Checks
        * Unit Tests
        * Infrastructure Tests
        * Build
        * Deploy
* **GitOps:**
    * Adopt GitOps practices.
    * **Argo CD** (If using Kubernetes)
* **Automation Scripts:**
    * Develop scripts for common tasks:
        * Scaling
        * Backups/Restores
        * Incident response automation

**V. Reliability and Resilience**

* **High Availability:**
    * **Prometheus HA:** Explore Prometheus HA options.
    * **Load Balancing:** Use load balancers.
* **Disaster Recovery:**
    * **Backup and Restore:** Implement a backup/restore strategy.
    * **Disaster Recovery Plan:** Develop a DR plan.
* **Chaos Engineering:**
    * Practice chaos engineering.
    * **Tools:**
        * **Chaos Mesh** (If using Kubernetes)

**VI. Documentation and Collaboration**

* **Comprehensive Documentation:**
    * Maintain up-to-date documentation.
    * **Include:**
        * Architecture diagrams
        * Deployment procedures
        * Troubleshooting guides
        * Runbooks
* **Collaboration Tools:**
    * **GitHub:** Version control, code review, issues.
    * **Confluence or Google Docs:** Documentation.
    * **Jira:** Project management, issue tracking.
* **Runbooks:**
    * Create detailed runbooks for common incidents.

