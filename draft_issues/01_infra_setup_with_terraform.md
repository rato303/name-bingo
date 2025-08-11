---
name: '【基盤】TerraformによるAWSインフラの初期構築'
about: 'TerraformによるAWSインフラの初期構築'
title: '【基盤】TerraformによるAWSインフラの初期構築'
labels: 'feature, infrastructure'
assignees: ''

---

## 背景と目的 (Background and Purpose)

AWSリソースをコードで管理（IaC）することで、インフラの再現性を高め、効率的な環境構築を実現します。
本タスクは、アプリケーションの稼働に必要となる基本的なクラウドインフラの基盤を構築することを目的とします。

## 概要 (Overview)

開発に必要なAWSリソースの基本的な構成をTerraformで記述し、IaC（Infrastructure as Code）の基盤を構築します。
まずは開発環境（dev）を対象とし、以下のリソースを作成します。

- Amazon API Gateway (WebSocket API)
- AWS Lambda
- Amazon DynamoDB
- AWS Amplify Hosting

## タスク (Tasks)

- [ ] Terraformの初期設定（Provider, Backend設定）
- [ ] API Gateway (WebSocket) のリソース定義
- [ ] Lambda関数のリソース定義（暫定的なダミー関数で可）
- [ ] DynamoDBテーブルのリソース定義（要件定義に基づくテーブル設計）
- [ ] Amplify Hostingのリソース定義
- [ ] `terraform apply` を実行し、AWS上にリソースが作成されることを確認

## 完了の定義 (Definition of Done)

- `terraform apply` がエラーなく完了し、AWS上に上記リソースが作成されていること。
- 作成されたリソース構成が、`design-docs/01_要件定義.md` の内容と一致していること。

## 関連ドキュメント (Related Documents)

- `design-docs/01_要件定義.md`

## 備考 (Notes)

- まずは開発（dev）環境のみを対象とします。
