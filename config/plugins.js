module.exports = ({ env }) => ({
  "users-permissions": {
    config: {
      grant: {
        google: {
          redirectUri: env(
            "GOOGLE_REDIRECT_URI",
            "http://localhost:3000/api/auth/google/callback"
          ),
        },
      },
    },
  },
});
