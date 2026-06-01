import { Plugin } from "@opencode-ai/plugin";

export const NotifySendPlugin: Plugin = async ({ $ }) => {
  const mainSessions = new Set<string>();
  const notify = async (summary: string, body: string) => {
    try {
      await $`notify-send -i ~/.config/opencode/plugin/opencode-logo-dark.svg ${summary} ${body}`;
    } catch { }
  };

  return {
    event: async ({ event }) => {
      switch (event.type) {
        case "session.created":
          const session = event.properties.info;
          if (!session.parentID) {
            mainSessions.add(session.id);
          }
          break;
        case "session.deleted":
          mainSessions.delete(event.properties.info.id);
          break;
        case "session.status":
          const { sessionID, status } = event.properties;
          if (status.type === "idle" && mainSessions.has(sessionID)) {
            await notify("OpenCode", "Session status updated");
          }
          break;
        case "question.asked":
          await notify("OpenCode", "Question asked");
          break;
        case "permission.asked":
          await notify("OpenCode", "Permission requested");
          break;
      }
    },
  };
};
