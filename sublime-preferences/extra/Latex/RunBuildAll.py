import sublime
import sublime_plugin


class RunBuildAllCommand(sublime_plugin.WindowCommand):
    def run(self, build_system1, build_system2, build_system3):
        self.window.run_command("set_build_system", {"file": build_system1})
        self.window.run_command("build")
        self.window.run_command("set_build_system", {"file": build_system2})
        self.window.run_command("build")
        self.window.run_command("set_build_system", {"file": build_system3})
        self.window.run_command("build")
