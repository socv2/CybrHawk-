# Copy of Deployment Options

By default, the platform is delivered from our global SaaS infrastructure, with certain components, such as NDR sensors, log collectors, and honeypots, deployed on the customer's premises.

## **Global SaaS (ThreatDefence Managed):**

Using our existing global SaaS platform is the fastest path to deployment. It only requires provisioning a login account to activate the SOC/SIEM service, allowing organisations to achieve full operational capability within hours or a single day. This is the recommended setup for all new customers, as it involves no initial cost and enables rapid deployment. For all other options, ThreatDefence can still manage the project, deployment and deliver a working solution.

## **In-Country SaaS:**

For service providers required to meet sovereign (in-country) data requirements, it is necessary to secure a local hosting provider for virtual or dedicated servers, or to purchase hardware. Under certain conditions, ThreatDefence may sponsor or share these setup costs. This setup allows for unlimited dynamic expansion of hardware resources to meet future growth demands.

_**Options for In-Country SaaS:**_

1. **Local Hosting Provider:**
   * Provide the hosting provider with an inventory of required hardware and connectivity specifications.
   * ThreatDefence or the Managed Service Provider (MSP) can manage the relationship with the local hosting provider for project management and support.
2. **Local Data Centre:**
   * Rent cabinet space in a local data centre.
   * Purchase hardware (5+ servers, network switches, firewalls).
   * ThreatDefence takes full accountability and will project-manage, deploy and support the setup.
3. **Cloud Provider (AWS/Azure/Alibaba/Google):**
   * Note: Data storage costs can exceed the service fees.
   * Carries some risk of privacy loss and potential foreign interference.
   * Quick setup.

**Recommendation: Local Data Centre.** This option offers the best performance, lowest and most predictable long-term cost, full control, guaranteed privacy, and freedom from third-party risk or interference. For example, an initial, one-time hardware investment of approximately $100k can generate over $500k in monthly revenue.

## **On-Premises Setup:**

A complete on-premises deployment is supported and is typically suitable for very large organisations bound by strict compliance rules. This is the most expensive option, as it requires significant customer resources to deploy and manage the infrastructure, which can introduce considerable delays and operational burden on the customer.

Customers who require on-premises setups to meet sovereign data storage needs can address these concerns by connecting their infrastructure via dark fibre to an **In-Country SaaS** node.

_Options for On-Premises Setup:_

1. **Fully On-Premises:**
   * Requires extensive customer resources to manage infrastructure, making it the most costly option.
2. **Private SaaS:**
   * A dark fibre connection is deployed between the customer's on-premises setup and the local In-Country SaaS node.

**Recommendation: Private SaaS.**

**Summary:**

* **For most customers:** **Global SaaS** is recommended for its speed and ease.
* **For sovereign data needs, in-country SaaS in a local data centre** offers the optimal balance of control, cost and security.
* **For strict compliance:** A **Private SaaS** model, connecting an on-premises setup via dark fibre to an In-Country SaaS node, provides the required sovereignty without full self-management.

Summary:

Cost scale: (0 =free, 5=most expensive)

<table data-header-hidden><thead><tr><th width="170.9500732421875">Cost to setup</th><th>Ongoing costs</th><th data-hidden>Options</th><th data-hidden>Initial setup time</th></tr></thead><tbody><tr><td>0</td><td>0</td><td>Global SaaS</td><td>5 minutes</td></tr><tr><td>3</td><td>1 (data storage)</td><td>In-country SaaS - managed hosting</td><td><br>2-4 weeks</td></tr><tr><td>2</td><td>0</td><td>In-country SaaS - local data centre</td><td><br>2-4 weeks</td></tr><tr><td>2</td><td>0</td><td>Private SaaS</td><td>Instant, once setup</td></tr><tr><td>5</td><td>5 (customer resources)</td><td>On-prem per customer</td><td>2 weeks to 1 year( customer resources delay)<br></td></tr><tr><td>2</td><td>5 (data storage)</td><td>Cloud providers</td><td>1 week</td></tr></tbody></table>
