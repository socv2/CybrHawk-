# CloudFlare

CybrHawk integrates with **Cloudflare** to ingest security logs and events for monitoring, detection, and incident response.\
This integration provides visibility into DNS queries, WAF activity, DDoS mitigation, and Zero Trust events.

***

## Integration Method

Cloudflare log delivery is supported through **AWS SQS (Simple Queue Service)**.\
Logs are pushed by Cloudflare into an AWS SQS queue, which CybrHawk then consumes securely into the SIEM platform.

For setup, follow the [AWS SQS Integration Guide](../public-cloud/aws-sqs.md).

***

## Prerequisites

* A Cloudflare Enterprise account with **Logpush** enabled.
* Access to an AWS account to configure **SQS queues**.
* Cloudflare account with sufficient permissions to configure **Logpush jobs**.
* CybrHawk-provided instructions for SQS subscription and integration verification.

***

## Next Steps

1. Configure Cloudflare **Logpush** to deliver events into your AWS SQS queue.
2. Ensure the queue is configured according to the [AWS SQS integration steps](../public-cloud/aws-sqs.md).
3. Send the queue details (ARN, region, and access keys if applicable) to 📧 **socv2@cybrhawk.com**.
4. CybrHawk engineers will validate ingestion and confirm visibility of Cloudflare events.

***
