# CloudFlare DNS Security

CybrHawk integrates with **Cloudflare DNS Security** to ingest DNS query and policy enforcement logs.\
This integration provides visibility into malicious domains, blocked queries, phishing attempts, and user DNS activity.

***

## Integration Method

Cloudflare DNS logs are delivered via **AWS SQS (Simple Queue Service)**.\
Cloudflare Logpush exports DNS security logs into an AWS SQS queue, which CybrHawk securely ingests into the SIEM platform.

For setup, follow the [AWS SQS Integration Guide](../public-cloud/aws-sqs.md).

***

## Prerequisites

* A Cloudflare Enterprise account with **DNS Security Logpush** enabled.
* Access to an AWS account to configure **SQS queues**.
* Cloudflare account permissions to create and manage **Logpush jobs**.
* CybrHawk-provided SQS subscription details for integration.

***

## Next Steps

1. Configure Cloudflare DNS Security **Logpush** to deliver logs to your AWS SQS queue.
2. Follow the [AWS SQS integration steps](../public-cloud/aws-sqs.md) to prepare the queue.
3. Send the SQS queue details (ARN, region, access keys if applicable) to 📧 **support@threatdefence.com**.
4. CybrHawk engineers will validate ingestion and confirm DNS logs are flowing into the platform.

***
