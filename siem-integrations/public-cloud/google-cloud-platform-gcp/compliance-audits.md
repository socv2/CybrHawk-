# Compliance Audits

CybrHawk's GCP integration provides best practice assessments, audits, incident response, continuous monitoring, hardening and forensics readiness, and also offers remediations.

## Prerequisites

CybrHawk requires the following permissions to scan Google Cloud:

#### IAM Roles

* Reader (`roles/reader`) – Must be granted at the project, folder, or organization level to allow scanning of target projects.

#### Project-Level Settings

At least one project must have the following configurations:

* Identity and Access Management (IAM) API (iam.googleapis.com) – Must be enabled via:
  * The Google Cloud API UI, or
  *   The gcloud CLI:

      ```bash
      gcloud services enable iam.googleapis.com --project <your-project-id>
      ```
* Service Usage Consumer (`roles/serviceusage.serviceUsageConsumer`) IAM Role – Required for resource scanning.
* Quota Project Setting – Define a quota project using:
  *   The gcloud CLI:

      ```bash
      gcloud auth application-default set-quota-project <project-id>
      ```

## Step 1: Configure the Service Account

CybrHawk uses a service account to perform scans. CybrHawk will scan all projects available to the service account. Follow these steps to create and configure the service account:

1. **Create a Service Account**:
   * Navigate to the [Google Cloud Console](https://console.cloud.google.com/).
   * Go to **IAM & Admin** > **Service Accounts**.
   * Click **Create Service Account**.
   * Provide a name and description for the service account.
   * Click **Create and Continue**.
2. **Assign Roles to the Service Account**:
   * Assign the following roles:
     * Viewer (`roles/viewer`)
     * Security Reviewer (`roles/iam.securityReviewer`)
     * Service Usage Consumer (`roles/serviceusage.serviceUsageConsumer`)
   * Click **Continue** and then **Done**.
3. **Create and Download a Service Account Key**:
   * In the Service Accounts list, click on the newly created service account.
   * Go to the **Keys** tab.
   * Click **Add Key** > **Create New Key**.
   * Select **JSON** and click **Create**.
   * Save the downloaded JSON key file securely, as it will be used for authentication in CybrHawk.

## Step 2: Onboard the Integration

1. Log in to your [CybrHawk SIEM Portal](https://portal.cybrhawk.com/).
2. Navigate to **Deployments** > **Integrations**.
3. Click **Add** and select **GCP Auditor**.
4. Upload the JSON key file you downloaded earlier.
