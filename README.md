# SMS to Telegram Forwarder

A Docker container that forwards SMS messages from a GSM modem to a Telegram chat using gammu-smsd.

## Features

- Forwards incoming SMS messages to a specified Telegram chat
- Supports any GSM modem compatible with gammu
- Available in two variants: Ubuntu-based and Alpine-based images
- Configurable PIN code for SIM card
- Real-time message forwarding
- Supports multiple messages handling

## Prerequisites

- Docker installed on your system
- GSM modem (Huawei or compatible)
- Telegram Bot Token
- Telegram Chat ID
- SIM card (with or without PIN)

## Quick Start

1. Create a Telegram bot using [@BotFather](https://t.me/botfather) and get the bot token
2. Get your Telegram chat ID (you can use [@userinfobot](https://t.me/userinfobot))
3. Pull and run the container:

```bash
docker run -d \
  --device=/dev/ttyUSB0:/dev/ttyUSB0 \
  -e DEVICE=/dev/ttyUSB0 \
  -e PIN=0000 \
  -e BOT_TOKEN=your_telegram_bot_token \
  -e CHAT_ID=your_telegram_chat_id \
  kutovoys/sms-to-telegram
```

## Environment Variables

| Variable  | Description                          | Default  |
| --------- | ------------------------------------ | -------- |
| DEVICE    | Path to GSM modem device             | Required |
| PIN       | SIM card PIN code                    | 0000     |
| BOT_TOKEN | Telegram Bot API token               | Required |
| CHAT_ID   | Telegram chat ID to send messages to | Required |

## Docker Images

The project provides two Docker image variants:

- `kutovoys/sms-to-telegram:latest` - Ubuntu-based image
- `kutovoys/sms-to-telegram:alpine` - Alpine-based lightweight image

Choose the Alpine variant if you prefer a smaller image size and reduced resource usage.

## Building from Source

To build the Ubuntu-based image:

```bash
docker build -t sms-to-telegram .
```

To build the Alpine-based image:

```bash
docker build -f Dockerfile.alpine -t sms-to-telegram:alpine .
```

## How It Works

1. The container uses gammu-smsd to monitor the GSM modem for incoming messages
2. When a new SMS is received, gammu-smsd triggers the `sms_to_telegram.sh` script
3. The script formats the message and sends it to Telegram using the Bot API
4. Messages include the sender's phone number and the message text

## Troubleshooting

1. Make sure your GSM modem is properly connected and recognized by the system
2. Check if the correct device path is provided in the DEVICE environment variable
3. Verify that the SIM card PIN is correct if PIN protection is enabled
4. Ensure the Telegram bot token is valid and the bot has permission to send messages
5. Confirm that the chat ID is correct and the bot is a member of the chat
