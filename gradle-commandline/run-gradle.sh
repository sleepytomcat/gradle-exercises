echo "=================================================================="
echo "1) display version"
echo "=================================================================="
gradle -v

echo "=================================================================="
echo "2) executing multiple tasks"
echo "   note that every task is executed no more than once"
echo "   '--console plain' switch forces 'minimalistic' output"
echo "=================================================================="
gradle dist test --console plain

echo "=================================================================="
echo "3) excluding tasks from execution"
echo "   executing 'dist' but not 'test' (and all of its pre-requisites)"
echo "=================================================================="
gradle dist -x test --console plain

echo "=================================================================="
echo "4) do not stop on first error - continue execution of other tasks"
echo "=================================================================="
gradle failure dist --continue --console plain

echo "=================================================================="
echo "5) task name abbreviation"
echo "   'di' expanded to 'dist', 'cT' deduced to 'compileTests'" 
echo "=================================================================="
gradle di --console plain
gradle cT --console plain

echo "=================================================================="
echo "6) selecting which build to execute"
echo "=================================================================="
gradle -b alternative.build.gradle compile --console plain

echo "=================================================================="
echo "7) selecting which sub-project to build"
echo "=================================================================="
gradle -p subproject hello --console plain

echo "=================================================================="
echo "8) gradle support incremental builds"
echo "   (i.e. why recompile a file if it has not changed?)"
echo "   still can force task to run with --rerun-tasks <task>"
echo "=================================================================="
gradle --rerun-tasks compile --console plain

echo "=================================================================="
echo "9) list projects"
echo "=================================================================="
gradle projects --console plain

echo "=================================================================="
echo "10) list tasks"
echo "    see 'build.gradle' for task description/group customization"
echo "=================================================================="
gradle tasks --console plain

echo "=================================================================="
echo "11) list all tasks"
echo "=================================================================="
gradle tasks --all --console plain

echo "=================================================================="
echo "12) list task details"
echo "=================================================================="
gradle help --task dist --console plain

echo "=================================================================="
echo "13) list dependencies"
echo "=================================================================="
gradle dependencies --console plain

echo "=================================================================="
echo "14) filter by configuration"
echo "    (build script has no configuration for now,"
echo "     so next line will fail)"
echo "=================================================================="
gradle dependencies --configuration some-config-name --console plain

echo "=================================================================="
echo "15) list build script dependencies for selected project"
echo "=================================================================="
gradle buildEnvironment -q

echo "=================================================================="
echo "16) inspect dependencies" 
echo "    (will fail as there's no dependencies/configurations"
echo "     in the build script for now)"
echo "=================================================================="
gradle dependencyInsight --configuration some-configuration --dependency some-dependency --console plain

echo "=================================================================="
echo "17) list project properties"
echo "=================================================================="
gradle properties --console plain

echo "=================================================================="
echo "18) profile build"
echo "=================================================================="
gradle dist --profile --console plain

echo "=================================================================="
echo "19) dry run - use -m option"
echo "=================================================================="
gradle -m dist --console plain
