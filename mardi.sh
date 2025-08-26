#!/usr/bin/env bash
# scaffold.sh – generates the exact folder & file tree for the Matchly project
# Run from an empty directory:  bash scaffold.sh

set -euo pipefail

# --------------------------------------------------
# Helper: create empty file with any missing dirs
# --------------------------------------------------
touch_file() {
  mkdir -p "$(dirname "$1")"
  touch "$1"
}

# --------------------------------------------------
# Define the entire tree (files without content)
# --------------------------------------------------
files=(
  clients/mobile/src/components/Card.tsx
  clients/mobile/src/components/AdBanner.tsx
  clients/mobile/src/components/LikeButton.tsx
  clients/mobile/src/screens/OnboardingScreen.tsx
  clients/mobile/src/screens/MatchScreen.tsx
  clients/mobile/src/screens/ChatScreen.tsx
  clients/mobile/src/screens/VideoCallScreen.tsx
  clients/mobile/src/screens/SubscriptionScreen.tsx
  clients/mobile/src/navigation/AppNavigator.tsx
  clients/mobile/src/navigation/AuthNavigator.tsx
  clients/mobile/src/services/api.ts
  clients/mobile/src/services/authService.ts
  clients/mobile/src/hooks/useSwipe.ts
  clients/mobile/src/hooks/useUser.ts
  clients/mobile/src/utils/geoUtils.ts
  clients/mobile/assets/.gitkeep
  clients/mobile/app.config.js
  clients/mobile/App.tsx
  clients/mobile/babel.config.js
  clients/mobile/tsconfig.json
  clients/mobile/package.json

  clients/web-app/public/.gitkeep
  clients/web-app/src/pages/Home.tsx
  clients/web-app/src/pages/MatchPage.tsx
  clients/web-app/src/pages/AdminLogin.tsx
  clients/web-app/src/components/SwipeCard.tsx
  clients/web-app/src/components/ChatWindow.tsx
  clients/web-app/src/services/api.ts
  clients/web-app/src/hooks/useSocket.ts
  clients/web-app/src/App.tsx
  clients/web-app/vite.config.ts
  clients/web-app/package.json

  clients/admin-dashboard/src/pages/Users.tsx
  clients/admin-dashboard/src/pages/Reports.tsx
  clients/admin-dashboard/src/pages/Revenue.tsx
  clients/admin-dashboard/src/pages/Moderation.tsx
  clients/admin-dashboard/src/components/DataTable.tsx
  clients/admin-dashboard/src/App.tsx
  clients/admin-dashboard/package.json

  gateway/src/routes/auth.route.ts
  gateway/src/routes/user.route.ts
  gateway/src/routes/chat.route.ts
  gateway/src/middleware/auth.middleware.ts
  gateway/src/middleware/rateLimit.middleware.ts
  gateway/src/server.ts
  gateway/Dockerfile
  gateway/package.json

  services/auth-service/src/controllers/auth.controller.ts
  services/auth-service/src/services/auth.service.ts
  services/auth-service/src/server.ts
  services/auth-service/Dockerfile
  services/auth-service/package.json

  services/profile-service/src/server.ts
  services/profile-service/Dockerfile

  services/chat-service/src/websocket/socketServer.ts
  services/chat-service/src/server.ts
  services/chat-service/Dockerfile
  services/chat-service/package.json

  services/payment-service/src/controllers/payment.controller.ts
  services/payment-service/src/stripe.webhook.ts
  services/payment-service/Dockerfile

  ai-engine/facial-recognition/src/api.py
  ai-engine/facial-recognition/notebooks/train_face_model.ipynb
  ai-engine/facial-recognition/requirements.txt
  ai-engine/facial-recognition/Dockerfile

  ai-engine/matching-engine/src/server.py
  ai-engine/matching-engine/Dockerfile

  prisma/schema.prisma
  prisma/seed.ts

  docs/openapi.yaml
  docs/API.md
  docs/DEPLOYMENT.md

  scripts/seed-dev-data.ts
  scripts/test-stripe-webhook.ts
  scripts/setup-ssl.sh

  tests/unit/auth.service.test.ts
  tests/integration/match.e2e.ts
  tests/mocks/mockData.ts

  infra/nginx/default.conf
  infra/nginx/Dockerfile
  infra/docker-compose.yml
  infra/docker-compose.prod.yml

  .github/workflows/ci-cd.yml

  public/swagger-ui/.gitkeep

  .env.example
  .gitignore
  README.md
  package.json
)

# --------------------------------------------------
# Create everything
# --------------------------------------------------
for f in "${files[@]}"; do
  touch_file "$f"
done

echo "✔ Matchly project scaffold created successfully."