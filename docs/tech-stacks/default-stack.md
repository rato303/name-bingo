# デフォルト技術スタック設定

## 概要
このドキュメントは、新規プロジェクト向けのデフォルト技術選択を定義します。これらの選択は、チームの習熟度、エコシステムの成熟度、開発効率を優先しています。

## バックエンド開発
### 主要言語・フレームワーク
- **言語**: JavaScript/TypeScript (Node.js 22)
- **主要フレームワーク**: Express.js
- **代替フレームワーク**: NestJS（大規模アプリケーション向け）

### データベースシステム
- **主要リレーショナルDB**: PostgreSQL
- **主要NoSQL DB**: MongoDB
- **キャッシュ層**: Redis
- **ORM/ODM**: Prisma (SQL), Mongoose (MongoDB)

### API・通信
- **APIスタイル**: RESTful APIs
- **APIドキュメント**: OpenAPI/Swagger
- **リアルタイム通信**: WebSockets (Socket.io)
- **メッセージキューイング**: Redis Pub/Sub

## フロントエンド開発
### 主要フレームワーク
- **フレームワーク**: React 18+
- **言語**: TypeScript
- **ビルドツール**: Vite
- **ルーティング**: React Router

### UI・スタイリング
- **CSSフレームワーク**: Tailwind CSS
- **コンポーネントライブラリ**: Headless UI
- **アイコンライブラリ**: Heroicons
- **フォーム処理**: React Hook Form

### 状態管理
- **クライアント状態**: React Query/TanStack Query
- **グローバル状態**: Zustand
- **フォーム状態**: React Hook Form

## インフラストラクチャ・DevOps
### クラウドプラットフォーム
- **主要**: AWS
- **コンテナプラットフォーム**: Docker
- **コンテナオーケストレーション**: Docker Compose（開発）, ECS（本番）

### CI/CDパイプライン
- **バージョン管理**: GitHub
- **CI/CD**: GitHub Actions
- **パッケージレジストリ**: npm registry

### 監視・可観測性
- **アプリケーション監視**: CloudWatch
- **エラートラッキング**: Sentry
- **ログ出力**: Winston + CloudWatch Logs

## テスト戦略
### テストフレームワーク
- **ユニットテスト**: Jest
- **統合テスト**: Jest + Supertest
- **E2Eテスト**: Playwright
- **フロントエンドテスト**: React Testing Library

### コード品質
- **リンティング**: ESLint
- **フォーマッティング**: Prettier
- **型チェック**: TypeScript
- **プリコミットフック**: Husky + lint-staged

## 開発ツール
### IDE・拡張機能
- **主要IDE**: VS Code
- **必須拡張機能**: 
  - ClaudeCode
  - Prettier
  - ESLint
  - TypeScript

### パッケージ管理
- **パッケージマネージャー**: npm
- **Nodeバージョン管理**: nvm

## セキュリティ・コンプライアンス
### 認証・認可
- **認証**: JWT
- **認可**: RBAC（ロールベースアクセス制御）
- **パスワードハッシュ化**: bcrypt

### セキュリティツール
- **依存関係スキャン**: npm audit
- **コードセキュリティ**: ESLintセキュリティルール
- **環境管理**: dotenv

## 設定ノート
- このスタックは、フルスタック一貫性のためJavaScript/TypeScriptを優先
- チームの専門知識とエコシステムの成熟度に基づいて技術選択
- project-configs/でプロジェクトごとにオーバーライド可能
- エンジニアリングマネージャーによる定期レビューと更新管理

## 最終更新
- **日付**: 2025-08-14
- **レビュー者**: エンジニアリングマネージャー
- **次回レビュー**: 2025-11-14