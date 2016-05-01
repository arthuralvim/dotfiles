import sublime
import sublime_plugin


class RunBuildCommand(sublime_plugin.WindowCommand):
    def run(self, build_system):
        self.window.run_command("set_build_system", {"file": build_system})
        self.window.run_command("build")
