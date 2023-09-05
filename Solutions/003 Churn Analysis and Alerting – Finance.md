---
title: Churn Analysis and Alerting – Financial Services
category: use case
industries: [Financial Services, Insurance]
owner: Tom Debus
tags: [churn, churnanalysis, financialservices, insurance, bank, retention, clientretention, customerretention]
clients: [UBS]
---

## Churn Analysis and Alerting

### Executive summary
Screening your existing client population for signs of dissatisfaction and pending attrition can involve a broad range of analysis. Usually the focus is given to transaction pattern analysis. And while this may prove helpful it can be misleading in smaller banks with limited comparative data. We thus integrate a broader variety of less obvious indicators and include an advisor based reinforcement loop to train the models for a bank‘s specific churn footprint.

### Problem statement
When clients close their accounts or cancel their mandates, it usually does not come as a surprise to the Relationship Manager (RM). But for obvious reasons, the RM tries to work against the loss of a client with similar if not the same tools, processes and attitudes that have led to a client being dissatisfied. This is not to say that the RM manager is the sole reason for churn. But often clients do not or not sufficiently voice their issues and simply quit the relationship. To search, become aware and then listen for softer and indirect signs is at the heart of this use case.

### Target market / Industries
The described use case can be efficiently applied to any industry that is providing services to a large number of clients and has a large number of transactions.
Particularly following industries are benefiting most of this use-case:
- Financial services
- Insurance

### Solution
Using historical data, client communication and structured interviews with client advisors, we create a bank-specific churn ontology, that is then used to screen existing clients on an ongoing basis. Creating an interactive reinforcement loop with new churn-cases, this classification, predictor and indicator approach is ever more fine tuned to specific segments, desks and service categories. As direct and ongoing Key Performance Indicators (KPIs) churn ratios and client satisfaction are measured alongside Assets under Management (AuM), profitability and trade volumes for the respective clients are classified as “endangered”.
Usually a gradual improvement can be monitored within 3-6 months from the start of the use case.

The solution included:
- Initial typical churn cause analysis based on historical data (client positions, and transactions)
- Ideally inclusion of CRM notes and written advisor to client communication (prior to churn)
- Sales & Churn Ontology setup & subsequent ontology matching
- Identification of likely bank churn footprint & learning / improvement loops
- Aggregation of findings, reporting, alerting & action notifications

### Stakeholders
- Chief Operations
- Client advisory, Relationship and Sales management

### Data elements, Assets and Deliverables
As an Input from the client, the following items were used:
- Historic data about churned clients
- Client portfolios - positions / transactions
- Ideally pre-leave client-advisor communications

Assets & Artefacts:
- Client Behavioral Model
- Churn Prediction
- Action Monitoring

The deliverables included:
- Sales & Churn Indicator Ontology
- Use case specific orchestration flow

### Impact and benefits
Lowered churn rates for distinct client segments by 16% after 6 months. Increased AuM / trades for clients „turned-around“ by about 25% within 6 months after “re-win”.

The use-case implementation resulted in:

+8% clients saved prior to loss of relationship

+24% reduction of customer asset outflows

### Testimonials
> "Changing the attitude we deal with churn from feeling like a failure to working a structured process, made all the difference. Turning around a dissatisfied client is now something transparent and achievable."
> — Mr. Roland Giger, Head of Client Book Development, UBS

### Tags / Keywords
#churn #churnanalysis #financialservices #insurance #bank #retention #clientretention #customerretention
