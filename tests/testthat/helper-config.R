# Helper to set up a minimal config.yml for tests that depend on config values.
# testthat automatically sources files matching helper-*.R before running tests.

setup_test_config <- function(envir = parent.frame()) {
  config_path <- tempfile(fileext = ".yml")
  writeLines(
    c(
      "default:",
      "  plans:",
      "    references:",
      "        BAU: \"bau\"",
      "    scenarios:",
      "        NSP: \"nsp\"",
      "  intervention_exclusivity:",
      "    case_management:",
      "      - \"deployed_int_CM\"",
      "      - \"deployed_int_ICCM\"",
      "    net_types:",
      "      - \"deployed_int_STD_Nets\"",
      "      - \"deployed_int_PBO_Nets\"",
      "      - \"deployed_int_IG2_Nets\"",
      "    preventive_chemo:",
      "      - \"deployed_int_PMC\"",
      "      - \"deployed_int_SMC\"",
      "  intervention_priorities:",
      "    deployed_int_CM: 10",
      "    deployed_int_ICCM: 9",
      "    deployed_int_STD_Nets: 8",
      "    deployed_int_PBO_Nets: 8",
      "    deployed_int_IG2_Nets: 8",
      "    deployed_int_IRS: 7",
      "    deployed_int_LSM: 6",
      "    deployed_int_IPTSc: 7",
      "    deployed_int_PMC: 6",
      "    deployed_int_SMC: 6",
      "    deployed_int_Vaccine: 5"
    ),
    config_path
  )
  withr::local_envvar(R_CONFIG_FILE = config_path, .local_envir = envir)
}
