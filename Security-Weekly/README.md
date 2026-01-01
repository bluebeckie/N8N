# Security Weekly

This repository contains an n8n workflow for monitoring and summarizing the latest security news from iThome.

![Security Weekly Workflow](https://github.com/bluebeckie/beckie-n8n/blob/main/Security-Weekly/Security-Weekly.png)

## Workflow Actions

This n8n workflow automates the process of fetching, processing, and delivering the latest security news. The workflow is designed to run on a schedule and send a summarized report to a LINE chat.

Here is a breakdown of the workflow's key actions:

1.  **Scheduled Trigger**: The workflow is initiated by a schedule, running automatically on Tuesdays at 11:30 AM.

2.  **URL Definition**: The initial URL for the iThome security news page is defined.

3.  **News URL Extraction**: An AI agent (using OpenAI's Chat Model) is used to extract the URL of the latest "資安週報" (Security Weekly) article.

4.  **News Summarization**: An AI agent (using Google's Gemini Model) summarizes the news article from the CISO's perspective, focusing on software supply chains, AI-related attacks, and suggested action items.

5.  **Message Formatting**: The summarized news report is formatted into a message suitable for sending to a LINE chat.

6.  **LINE Messaging**: The final summarized news report is sent as a message to a specified LINE chat.
