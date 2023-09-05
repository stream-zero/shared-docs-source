---
title: Intraday Liquidity Management Optimization
category: use case
industries: [Financial Service]
owner: Tom Debus
tags: [liquidity, liquiditymanagement, intradayliquiditymanagement, cashmanagement, BCBS, Basel3, financialservices]
clients: []
---

## Intraday Liquidity Management Optimization

### Executive summary
In order to avoid long internal lead times and to cater to stringent time-to-market expectations, an end-to-end Analytics Design and streaming real time analytics environment for group wide BCBS (Basel III) Intraday Liquidity Management was implemented. The bank's predictive liquidity and cash management models were rebuilt from scratch using real-time streams from 13 different SWIFT messaging gateways.

### Problem statement
All financial institutions need to be on top of their liquidity levels throughout the entire day. Since every organization usually experiencing many cash inflows and outflows during the day, it is diffcult to understand what are the currenct liquidity levels. To be compliant with the regulations, the liquidity levels need to be monitored. Having too much cash is not commerically viable and too little cash is too risky. Knowing the current cash levels the bank can adjust accordingly. The entire cash balancing act is based on the cascade of different events. Cash flow events and also cash-related events need to be integrated from various transaction management systems. 

### Target market / Industries
The use case is applicable in all regualted and cash-intence industries, i.e. 
- Financial service
- Treasury departments of large corporations

### Solution
During the use case implementation 16 different cash-flow generating order systems were integrated using different schemas of how they handle transactions. 
{{< param replacables.brand_name  >}} Data Platform was able to resolve the complexities of the event handling to absorb all different situations and rules that need to be applied depending on the different states that the system can take.
Data sourcing patterns evolved quickly from single file batch to data streaming using Kafka and Flink. A global end-user enablement was achieved with a multi network environment for regional user and both logical and physical data segregation. Irreversible client data protection using SHA 256 hash algorithm allowed for globally integrated algorithms in spite of highly confidential raw input data.
We were able to implement dynamic throttling and acceleration of cash flows depending on current market situations and liquidity levels.

The solution included:
- Adaptor agents to 16 cash-flow generating systems
- Throttling and acceleration logic
- Machine Learning (ML) models for liquidity projection
- Harmonized event architecture

### Stakeholders
- Group treasury
- Group risk and compliance
- CFO

### Data elements, Assets and Deliverables
As an Input from the client, the following items were used:
- Cash-flows

Assets & Artefacts:
- Harmonized transactional event model
- Throttling and acceleration rule book

The deliverables included:
- End to end solution for intraday liquidity

### Impact and benefits
The use-case implementation resulted in:
- 10 MCHF annual savings on liquidity buffers
- 23% reduction of operations & treasury staff

### Testimonials
>“Moving from a batch to a real-time liquidity monitoring was a substantial task that had countless positive knock-on effects throughout the organization.”

— Mr. Juerg Schnyder, Liquidity expert, Global universal bank

### Tags / Keywords
#liquidity #liquiditymanagement #intradayliquiditymanagement #cashmanagement #BCBS #Basel3 #financialservices