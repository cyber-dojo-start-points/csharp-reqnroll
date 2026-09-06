
lambda { |stdout,stderr,status|
  output = stdout + stderr

  # A step with no binding throws PendingStepException, which nunit records as
  # inconclusive rather than as a failure, and it still calls the overall
  # result Passed. That scenario did not run, so nothing was measured, and the
  # count is what says so. Checked before green and before red for the same
  # reason the ruby start-points check errors before failures: a scenario that
  # never ran outranks whatever the ones that did ran to.
  counts = /^\s+Test Count: \d+, Passed: \d+, Failed: \d+, Warnings: \d+, Inconclusive: (\d+)/.match(output)
  return :amber if counts && counts[1] != '0'

  #dotnet test, which the fallback line in cyber-dojo.sh uses:
  return :green if /^Passed!/.match(output)
  return :red   if /^Failed!/.match(output)

  #nunit console runner:
  return :green if /^\s+Overall result: (Passed|Warning)/.match(output) #'Warning' matches also Ignored tests
  return :red   if /^\s+Failed Tests/.match(output)
  return :amber
}
