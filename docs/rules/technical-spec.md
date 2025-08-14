# 技術設計ルール

## 1. コーディング標準とベストプラクティス

### 1.1 JavaScript/TypeScript 標準
- **言語バージョン**: Node.js 22 (ES2023+)
- **コードスタイル**: Prettier + ESLint設定を必須とする
- **命名規則**:
  - 変数・関数: camelCase (`userName`, `calculateTotal`)
  - 定数: UPPER_SNAKE_CASE (`API_BASE_URL`)
  - クラス: PascalCase (`UserService`)
  - ファイル: kebab-case (`user-service.js`)

### 1.2 コード品質基準
- **関数の責任**: 1つの関数は1つの責任のみを持つ（SRP）
- **関数の長さ**: 30行以内を目安とする
- **ネストの深さ**: 3階層以内を推奨
- **コメント**: 複雑な処理にはJSDocを必須とする

```javascript
/**
 * ユーザーの名前からビンゴカードを生成する
 * @param {string} name - ユーザー名
 * @param {number} size - カードサイズ (デフォルト: 5)
 * @returns {Array<Array<string>>} 2次元配列のビンゴカード
 */
function generateNameBingo(name, size = 5) {
  // 実装...
}
```

## 2. アーキテクチャ設計原則

### 2.1 レイヤード・アーキテクチャ
```
src/
├── presentation/    # UI層（フロントエンド）
├── application/     # アプリケーション層（ビジネスロジック）
├── domain/         # ドメイン層（コアロジック）
├── infrastructure/ # インフラ層（データ永続化、外部API）
└── shared/         # 共通ユーティリティ
```

### 2.2 依存性の方向
- 上位レイヤーは下位レイヤーに依存可能
- 下位レイヤーは上位レイヤーに依存してはいけない
- インフラ層はドメイン層のインターフェースを実装

### 2.3 設計パターンの適用
- **Repository パターン**: データアクセス層の抽象化
- **Service パターン**: ビジネスロジックの集約
- **Factory パターン**: オブジェクト生成の責任分離

## 3. セキュリティガイドライン

### 3.1 入力検証
- 全ての外部入力は検証・サニタイゼーションを必須とする
- バリデーションライブラリ（Joi, Zod等）の活用を推奨

```javascript
const userSchema = Joi.object({
  name: Joi.string().min(1).max(50).required(),
  email: Joi.string().email().required()
});
```

### 3.2 認証・認可
- JWTトークンによる認証を実装
- 重要な操作には再認証を要求
- セッションタイムアウトを適切に設定

### 3.3 データ保護
- 機密情報は環境変数で管理（.env）
- パスワードは適切にハッシュ化（bcrypt等）
- SQLインジェクション対策としてプリペアドステートメント使用

## 4. テスト戦略

### 4.1 テストピラミッド
- **単体テスト**: 70% - 各関数・メソッドレベル
- **統合テスト**: 20% - API・サービス間連携
- **E2Eテスト**: 10% - ユーザーシナリオ全体

### 4.2 テストフレームワーク
- **単体テスト**: Jest + Testing Library
- **E2Eテスト**: Playwright または Cypress
- **API テスト**: Supertest

### 4.3 テストカバレッジ基準
- **最低カバレッジ**: 80%以上
- **重要なビジネスロジック**: 95%以上
- **レポート生成**: CI/CD パイプラインで自動実行

### 4.4 テスト命名規則
```javascript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create user with valid data', () => {
      // テストケース
    });

    it('should throw error when name is empty', () => {
      // エラーケース
    });
  });
});
```

## 5. パフォーマンス基準

### 5.1 応答時間目標
- **API応答時間**: 95%のリクエストが200ms以内
- **ページロード時間**: First Contentful Paint 1.5秒以内
- **データベースクエリ**: 単体クエリ50ms以内

### 5.2 最適化指針
- **キャッシュ戦略**: Redis等を活用した適切なキャッシュ
- **データベース**: インデックス最適化、N+1問題の回避
- **フロントエンド**: バンドルサイズ最適化、遅延読み込み

### 5.3 監視・測定
- **APM ツール**: New Relic, DataDog等の導入
- **ログ管理**: 構造化ログ（JSON形式）
- **メトリクス**: Prometheus + Grafana等

## 6. エラーハンドリング

### 6.1 エラー分類
```javascript
class AppError extends Error {
  constructor(message, statusCode, isOperational = true) {
    super(message);
    this.statusCode = statusCode;
    this.isOperational = isOperational;
  }
}

class ValidationError extends AppError {
  constructor(message) {
    super(message, 400);
  }
}
```

### 6.2 ログ出力基準
- **ERROR**: システム障害、予期しないエラー
- **WARN**: 回復可能な問題、非推奨API使用
- **INFO**: 重要な業務イベント
- **DEBUG**: 開発時のデバッグ情報

### 6.3 エラーレスポンス形式
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "入力データが不正です",
    "details": {
      "field": "name",
      "reason": "必須項目が未入力です"
    }
  }
}
```

## 7. 開発環境とツール

### 7.1 必須ツール
- **IDE**: VS Code + ClaudeCode拡張機能
- **パッケージ管理**: npm（Node.js 22対応）
- **バージョン管理**: Git（ブランチ戦略はGit Flow）

### 7.2 開発コンテナ設定
```json
{
  "name": "Name Bingo",
  "image": "mcr.microsoft.com/devcontainers/universal:latest",
  "features": {
    "node:1": { "version": "22" }
  }
}
```

### 7.3 CI/CD パイプライン
- **ビルド**: テスト → リント → ビルド → セキュリティスキャン
- **デプロイ**: develop → staging → production
- **品質ゲート**: テストカバレッジ、静的解析結果

## 8. ドキュメント要件

### 8.1 コード内ドキュメント
- 公開API: JSDoc必須
- 複雑なアルゴリズム: インライン説明
- 設定ファイル: 各項目の説明コメント

### 8.2 プロジェクトドキュメント
- README.md: セットアップ手順
- API仕様書: OpenAPI/Swagger
- 設計書: アーキテクチャ図、ER図

## 9. 更新・レビュープロセス

### 9.1 技術標準の更新
- 四半期ごとにエンジニアリングマネージャーが技術標準を見直し
- 新技術導入時は影響調査とチーム合意を必須とする
- 変更履歴をGitで管理し、変更理由を明記

### 9.2 コードレビュー基準
- すべてのPRには最低1名のレビューを必須
- セキュリティ関連は2名以上のレビュー
- 設計変更を伴う場合は設計レビューを先行実施

このルールは生きたドキュメントとして、プロジェクトの成長とともに継続的に改善していく。