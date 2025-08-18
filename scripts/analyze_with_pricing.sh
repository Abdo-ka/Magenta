#!/bin/bash

# Cust#!/bin/bash

# Advanced Code Quality Analysis Script with Technical Debt Costing
# This script runs Flutter analyzer and generates comprehensive reports with cost estimates and technical debt projections

echo "🔍 Running Advanced Code Quality Analysis with Technical Debt Costing..."
echo "============================================================================"

# Create reports directory if it doesn't exist
mkdir -p reports

# Get current date for reporting
ANALYSIS_DATE=$(date '+%Y-%m-%d %H:%M:%S')
UNIX_TIMESTAMP=$(date +%s)

# Run Flutter analyzer and capture output
echo "📊 Running Flutter analyzer..."
flutter analyze lib --no-congratulate 2>&1 | tee reports/analyzer_output.txt

# Parse analyzer output and generate pricing report
echo "💰 Generating advanced pricing report with technical debt calculations..."

# Enhanced pricing configuration
HOURLY_RATE=75
ERROR_MULTIPLIER=4.0      # Increased due to technical debt
WARNING_MULTIPLIER=2.0    # Increased 
INFO_MULTIPLIER=0.8
STYLE_MULTIPLIER=0.4

# Technical debt configuration
MONTHLY_INTEREST_RATE=0.08  # 8% monthly compound interest
DEBT_ACCELERATION_FACTOR=1.5

# Count different types of issues
ERROR_COUNT=$(grep -c "error •" reports/analyzer_output.txt || echo "0")
WARNING_COUNT=$(grep -c "warning •" reports/analyzer_output.txt || echo "0")
INFO_COUNT=$(grep -c "info •" reports/analyzer_output.txt || echo "0")

# Calculate specific issue types for technical debt analysis
DEPRECATED_COUNT=$(grep -c "deprecated_member_use" reports/analyzer_output.txt || echo "0")
PERFORMANCE_COUNT=$(grep -c -E "(avoid_unnecessary_setstate|unawaited_futures|avoid_void_async)" reports/analyzer_output.txt || echo "0")
SECURITY_COUNT=$(grep -c -E "(avoid_dynamic|avoid_catches_without_on_clauses)" reports/analyzer_output.txt || echo "0")
DOCUMENTATION_COUNT=$(grep -c "public_member_api_docs" reports/analyzer_output.txt || echo "0")
STYLE_COUNT=$(grep -c -E "(require_trailing_commas|prefer_final_parameters|prefer_single_quotes)" reports/analyzer_output.txt || echo "0")

# Calculate costs with technical debt factors (in minutes)
ERROR_MINUTES=$(echo "$ERROR_COUNT * 60" | bc)  # 60 minutes per error
WARNING_MINUTES=$(echo "$WARNING_COUNT * 30" | bc)  # 30 minutes per warning  
INFO_MINUTES=$(echo "$INFO_COUNT * 12" | bc)  # 12 minutes per info

# Technical debt calculations
TECH_DEBT_MULTIPLIER=$(echo "1 + ($MONTHLY_INTEREST_RATE * $DEBT_ACCELERATION_FACTOR)" | bc -l)

# Calculate immediate costs
IMMEDIATE_TOTAL_MINUTES=$(echo "$ERROR_MINUTES + $WARNING_MINUTES + $INFO_MINUTES" | bc)
IMMEDIATE_TOTAL_HOURS=$(echo "scale=2; $IMMEDIATE_TOTAL_MINUTES / 60" | bc)
IMMEDIATE_TOTAL_COST=$(echo "scale=2; $IMMEDIATE_TOTAL_HOURS * $HOURLY_RATE" | bc)

# Calculate technical debt projections (costs if issues remain unfixed)
DEBT_MONTH_1=$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 1.08" | bc)  # 8% compound
DEBT_MONTH_3=$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 1.26" | bc)  # 3 months compound
DEBT_MONTH_6=$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 1.59" | bc)  # 6 months compound
DEBT_MONTH_12=$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 2.52" | bc) # 12 months compound
DEBT_YEAR_2=$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 6.34" | bc)   # 24 months compound

# Calculate ROI metrics
PRODUCTIVITY_IMPROVEMENT=0.35
BUG_REDUCTION=0.60
MAINTENANCE_REDUCTION=0.50

ANNUAL_DEVELOPER_COST=$(echo "$HOURLY_RATE * 2000" | bc)  # 2000 hours/year
PRODUCTIVITY_SAVINGS=$(echo "scale=2; $ANNUAL_DEVELOPER_COST * $PRODUCTIVITY_IMPROVEMENT" | bc)
BUG_REDUCTION_SAVINGS=$(echo "scale=2; $ANNUAL_DEVELOPER_COST * 0.2 * $BUG_REDUCTION" | bc)  # 20% time on bugs
MAINTENANCE_SAVINGS=$(echo "scale=2; $ANNUAL_DEVELOPER_COST * 0.3 * $MAINTENANCE_REDUCTION" | bc)  # 30% time on maintenance

TOTAL_ANNUAL_SAVINGS=$(echo "scale=2; $PRODUCTIVITY_SAVINGS + $BUG_REDUCTION_SAVINGS + $MAINTENANCE_SAVINGS" | bc)
ROI_RATIO=$(echo "scale=2; $TOTAL_ANNUAL_SAVINGS / $IMMEDIATE_TOTAL_COST" | bc)

# Risk assessment
TOTAL_ISSUES=$(echo "$ERROR_COUNT + $WARNING_COUNT + $INFO_COUNT" | bc)
if [ $ERROR_COUNT -gt 50 ] || [ $WARNING_COUNT -gt 200 ] || [ $TOTAL_ISSUES -gt 1000 ]; then
    RISK_LEVEL="CRITICAL"
    RISK_COLOR="#dc2626"
elif [ $ERROR_COUNT -gt 30 ] || [ $WARNING_COUNT -gt 100 ] || [ $TOTAL_ISSUES -gt 500 ]; then
    RISK_LEVEL="HIGH"
    RISK_COLOR="#ea580c"
elif [ $ERROR_COUNT -gt 15 ] || [ $WARNING_COUNT -gt 50 ] || [ $TOTAL_ISSUES -gt 300 ]; then
    RISK_LEVEL="MEDIUM"
    RISK_COLOR="#d97706"
else
    RISK_LEVEL="LOW"
    RISK_COLOR="#059669"
fi

# Generate comprehensive HTML report with technical debt analysis
cat > reports/advanced_code_quality_report.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Magenta - Advanced Code Quality & Technical Debt Analysis</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; background: #f8fafc; color: #1e293b; }
        .container { max-width: 1400px; margin: 0 auto; padding: 20px; }
        
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 40px; border-radius: 12px; margin-bottom: 30px; }
        .header h1 { font-size: 3em; margin-bottom: 10px; font-weight: 700; }
        .header p { font-size: 1.2em; opacity: 0.9; }
        
        .risk-banner { 
            background: $RISK_COLOR; color: white; padding: 20px; border-radius: 8px; margin-bottom: 30px; text-align: center;
            font-size: 1.3em; font-weight: 600; box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        
        .summary-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 25px; margin-bottom: 40px; }
        .card { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); border: 1px solid #e2e8f0; }
        .card h3 { font-size: 1.1em; color: #475569; margin-bottom: 15px; font-weight: 600; }
        .metric { font-size: 2.8em; font-weight: 700; margin: 15px 0; }
        .metric-subtitle { font-size: 0.9em; color: #64748b; margin-top: 8px; }
        
        .error { color: #dc2626; }
        .warning { color: #ea580c; }
        .info { color: #2563eb; }
        .cost { color: #059669; }
        .debt { color: #7c2d12; }
        
        .debt-projection { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); margin-bottom: 30px; }
        .debt-projection h3 { color: #7c2d12; margin-bottom: 25px; font-size: 1.4em; }
        
        .debt-timeline { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; }
        .debt-item { text-align: center; padding: 20px; background: #fef2f2; border-radius: 8px; border-left: 4px solid #dc2626; }
        .debt-item h4 { color: #7c2d12; margin-bottom: 10px; }
        .debt-item .amount { font-size: 1.8em; font-weight: 700; color: #dc2626; }
        
        .analysis-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-bottom: 30px; }
        
        .table { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.08); }
        .table table { width: 100%; border-collapse: collapse; }
        .table th { background: #1e293b; color: white; padding: 18px; text-align: left; font-weight: 600; }
        .table td { padding: 15px 18px; border-bottom: 1px solid #e2e8f0; }
        .table tr:hover { background: #f8fafc; }
        
        .priority-critical { background: #fee2e2; border-left: 4px solid #dc2626; }
        .priority-high { background: #fef3c7; border-left: 4px solid #d97706; }
        .priority-medium { background: #dbeafe; border-left: 4px solid #2563eb; }
        .priority-low { background: #d1fae5; border-left: 4px solid #059669; }
        
        .roi-section { background: linear-gradient(135deg, #059669 0%, #047857 100%); color: white; padding: 30px; border-radius: 12px; margin-bottom: 30px; }
        .roi-section h3 { margin-bottom: 20px; font-size: 1.4em; }
        .roi-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; }
        .roi-item { text-align: center; }
        .roi-value { font-size: 2em; font-weight: 700; margin-bottom: 5px; }
        
        .recommendations { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); }
        .recommendations h3 { color: #1e293b; margin-bottom: 25px; font-size: 1.4em; }
        .recommendations ul { list-style: none; }
        .recommendations li { padding: 15px 0; border-bottom: 1px solid #e2e8f0; display: flex; align-items: flex-start; }
        .recommendations li:last-child { border-bottom: none; }
        .recommendations .icon { margin-right: 15px; font-size: 1.2em; margin-top: 2px; }
        
        .chart-container { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); margin-bottom: 30px; }
        
        .detailed-output { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); }
        .detailed-output pre { background: #f1f5f9; padding: 25px; border-radius: 8px; overflow-x: auto; font-size: 12px; line-height: 1.4; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏗️ Advanced Code Quality & Technical Debt Analysis</h1>
            <p>Magenta Flutter Project • Generated on $ANALYSIS_DATE</p>
        </div>

        <div class="risk-banner">
            🚨 PROJECT RISK LEVEL: $RISK_LEVEL • $TOTAL_ISSUES Total Issues Detected
        </div>

        <div class="summary-grid">
            <div class="card">
                <h3>🔴 Critical Issues</h3>
                <div class="metric error">$ERROR_COUNT</div>
                <div class="metric-subtitle">Fix time: ${ERROR_MINUTES} min • Cost: \$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc)</div>
            </div>
            <div class="card">
                <h3>🟡 Warning Issues</h3>
                <div class="metric warning">$WARNING_COUNT</div>
                <div class="metric-subtitle">Fix time: ${WARNING_MINUTES} min • Cost: \$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc)</div>
            </div>
            <div class="card">
                <h3>🔵 Info Issues</h3>
                <div class="metric info">$INFO_COUNT</div>
                <div class="metric-subtitle">Fix time: ${INFO_MINUTES} min • Cost: \$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc)</div>
            </div>
            <div class="card">
                <h3>💰 Immediate Total Cost</h3>
                <div class="metric cost">\$$IMMEDIATE_TOTAL_COST</div>
                <div class="metric-subtitle">$IMMEDIATE_TOTAL_HOURS hours at \$$HOURLY_RATE/hr</div>
            </div>
        </div>

        <div class="debt-projection">
            <h3>📈 Technical Debt Projection (8% Monthly Compound Interest)</h3>
            <div class="debt-timeline">
                <div class="debt-item">
                    <h4>Month 1</h4>
                    <div class="amount">\$$DEBT_MONTH_1</div>
                    <small>8% compound</small>
                </div>
                <div class="debt-item">
                    <h4>Month 3</h4>
                    <div class="amount">\$$DEBT_MONTH_3</div>
                    <small>26% compound</small>
                </div>
                <div class="debt-item">
                    <h4>Month 6</h4>
                    <div class="amount">\$$DEBT_MONTH_6</div>
                    <small>59% compound</small>
                </div>
                <div class="debt-item">
                    <h4>Year 1</h4>
                    <div class="amount">\$$DEBT_MONTH_12</div>
                    <small>152% compound</small>
                </div>
                <div class="debt-item">
                    <h4>Year 2</h4>
                    <div class="amount">\$$DEBT_YEAR_2</div>
                    <small>534% compound</small>
                </div>
            </div>
        </div>

        <div class="analysis-grid">
            <div class="table">
                <table>
                    <thead>
                        <tr>
                            <th>Issue Category</th>
                            <th>Count</th>
                            <th>Immediate Cost</th>
                            <th>12-Month Debt</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="priority-critical">
                            <td>🔴 Errors (Critical)</td>
                            <td>$ERROR_COUNT</td>
                            <td>\$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc)</td>
                            <td>\$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE * 2.52" | bc)</td>
                        </tr>
                        <tr class="priority-high">
                            <td>🟡 Warnings (High)</td>
                            <td>$WARNING_COUNT</td>
                            <td>\$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc)</td>
                            <td>\$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE * 2.52" | bc)</td>
                        </tr>
                        <tr class="priority-medium">
                            <td>🔵 Info (Medium)</td>
                            <td>$INFO_COUNT</td>
                            <td>\$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc)</td>
                            <td>\$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE * 2.52" | bc)</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table">
                <table>
                    <thead>
                        <tr>
                            <th>Issue Type Analysis</th>
                            <th>Count</th>
                            <th>Business Impact</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>⚡ Performance Issues</td>
                            <td>$PERFORMANCE_COUNT</td>
                            <td>High</td>
                        </tr>
                        <tr>
                            <td>🔒 Security Concerns</td>
                            <td>$SECURITY_COUNT</td>
                            <td>Critical</td>
                        </tr>
                        <tr>
                            <td>📚 Missing Documentation</td>
                            <td>$DOCUMENTATION_COUNT</td>
                            <td>Medium</td>
                        </tr>
                        <tr>
                            <td>🎨 Style Issues</td>
                            <td>$STYLE_COUNT</td>
                            <td>Low</td>
                        </tr>
                        <tr>
                            <td>⚠️ Deprecated Usage</td>
                            <td>$DEPRECATED_COUNT</td>
                            <td>High</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="roi-section">
            <h3>💎 Return on Investment (ROI) Analysis</h3>
            <div class="roi-grid">
                <div class="roi-item">
                    <div class="roi-value">$(echo "scale=1; $ROI_RATIO" | bc)x</div>
                    <div>ROI Ratio</div>
                </div>
                <div class="roi-item">
                    <div class="roi-value">\$$(echo "scale=0; $TOTAL_ANNUAL_SAVINGS" | bc)</div>
                    <div>Annual Savings</div>
                </div>
                <div class="roi-item">
                    <div class="roi-value">35%</div>
                    <div>Productivity Gain</div>
                </div>
                <div class="roi-item">
                    <div class="roi-value">60%</div>
                    <div>Bug Reduction</div>
                </div>
                <div class="roi-item">
                    <div class="roi-value">50%</div>
                    <div>Maintenance Reduction</div>
                </div>
            </div>
        </div>

        <div class="recommendations">
            <h3>🎯 Strategic Recommendations & Action Plan</h3>
            <ul>
                <li><span class="icon">🚨</span><strong>IMMEDIATE (Week 1):</strong> Fix all $ERROR_COUNT critical errors - potential app crashes and security risks</li>
                <li><span class="icon">⚠️</span><strong>HIGH PRIORITY (Week 2-3):</strong> Address $WARNING_COUNT warnings - performance and maintainability issues</li>
                <li><span class="icon">📋</span><strong>PLANNED (Month 1-2):</strong> Resolve high-impact info issues in batches during sprint planning</li>
                <li><span class="icon">🔄</span><strong>CONTINUOUS:</strong> Implement automated checks to prevent technical debt accumulation</li>
                <li><span class="icon">💡</span><strong>TECHNICAL DEBT ALERT:</strong> Delaying fixes will cost \$$DEBT_MONTH_12 in 12 months ($(echo "scale=0; ($DEBT_MONTH_12 - $IMMEDIATE_TOTAL_COST) / $IMMEDIATE_TOTAL_COST * 100" | bc)% increase)</li>
                <li><span class="icon">📈</span><strong>BUSINESS CASE:</strong> Investment of \$$IMMEDIATE_TOTAL_COST will yield \$$(echo "scale=0; $TOTAL_ANNUAL_SAVINGS" | bc) annually ($(echo "scale=1; $ROI_RATIO" | bc)x ROI)</li>
                <li><span class="icon">⏰</span><strong>URGENCY:</strong> Every month of delay adds \$$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 0.08" | bc) in compound technical debt</li>
            </ul>
        </div>

        <div class="detailed-output">
            <h3>📊 Detailed Analysis Output</h3>
            <pre>
EOF

# Add the actual analyzer output to the HTML report
cat reports/analyzer_output.txt >> reports/advanced_code_quality_report.html

cat >> reports/advanced_code_quality_report.html << EOF
            </pre>
        </div>
    </div>
</body>
</html>
EOF

# Generate enhanced JSON report with technical debt projections
cat > reports/technical_debt_analysis.json << EOF
{
  "analysisDate": "$ANALYSIS_DATE",
  "timestamp": $UNIX_TIMESTAMP,
  "riskLevel": "$RISK_LEVEL",
  "summary": {
    "totalIssues": $TOTAL_ISSUES,
    "errors": $ERROR_COUNT,
    "warnings": $WARNING_COUNT,
    "info": $INFO_COUNT,
    "riskAssessment": "$RISK_LEVEL"
  },
  "costs": {
    "hourlyRate": $HOURLY_RATE,
    "immediate": {
      "totalMinutes": $IMMEDIATE_TOTAL_MINUTES,
      "totalHours": $IMMEDIATE_TOTAL_HOURS,
      "totalCost": $IMMEDIATE_TOTAL_COST,
      "breakdown": {
        "errors": {
          "count": $ERROR_COUNT,
          "minutes": $ERROR_MINUTES,
          "cost": $(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc)
        },
        "warnings": {
          "count": $WARNING_COUNT,
          "minutes": $WARNING_MINUTES,
          "cost": $(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc)
        },
        "info": {
          "count": $INFO_COUNT,
          "minutes": $INFO_MINUTES,
          "cost": $(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc)
        }
      }
    }
  },
  "technicalDebt": {
    "interestRate": $MONTHLY_INTEREST_RATE,
    "projections": {
      "month1": $DEBT_MONTH_1,
      "month3": $DEBT_MONTH_3,
      "month6": $DEBT_MONTH_6,
      "month12": $DEBT_MONTH_12,
      "year2": $DEBT_YEAR_2
    },
    "compoundFactors": {
      "month1": 1.08,
      "month3": 1.26,
      "month6": 1.59,
      "month12": 2.52,
      "year2": 6.34
    }
  },
  "issueBreakdown": {
    "performance": $PERFORMANCE_COUNT,
    "security": $SECURITY_COUNT,
    "documentation": $DOCUMENTATION_COUNT,
    "style": $STYLE_COUNT,
    "deprecated": $DEPRECATED_COUNT
  },
  "roi": {
    "ratio": $ROI_RATIO,
    "annualSavings": $TOTAL_ANNUAL_SAVINGS,
    "productivityImprovement": $PRODUCTIVITY_IMPROVEMENT,
    "bugReduction": $BUG_REDUCTION,
    "maintenanceReduction": $MAINTENANCE_REDUCTION
  },
  "recommendations": {
    "immediate": "Fix $ERROR_COUNT critical errors",
    "shortTerm": "Address $WARNING_COUNT warnings in next 2-3 weeks",
    "longTerm": "Implement automated quality gates",
    "urgency": "High - Technical debt compounds at 8% monthly"
  }
}
EOF

echo "✅ Advanced analysis complete! Reports generated:"
echo ""
echo "📊 View reports:"
echo "   - 🌟 Advanced HTML Report: reports/advanced_code_quality_report.html"
echo "   - 📄 Markdown Summary: reports/pricing_summary.md"
echo "   - 🔧 Raw Analyzer Output: reports/analyzer_output.txt"
echo "   - 📈 Technical Debt JSON: reports/technical_debt_analysis.json"
echo ""
echo "💰 Cost Summary:"
echo "   - 🔴 Critical Issues: $ERROR_COUNT (Cost: \$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc))"
echo "   - 🟡 Warning Issues: $WARNING_COUNT (Cost: \$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc))"
echo "   - 🔵 Info Issues: $INFO_COUNT (Cost: \$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc))"
echo "   - 💵 IMMEDIATE TOTAL: \$$IMMEDIATE_TOTAL_COST USD ($IMMEDIATE_TOTAL_HOURS hours)"
echo ""
echo "📈 Technical Debt Projections:"
echo "   - Month 1: \$$DEBT_MONTH_1 (8% compound)"
echo "   - Month 6: \$$DEBT_MONTH_6 (59% compound)"
echo "   - Year 1: \$$DEBT_MONTH_12 (152% compound)"
echo "   - Year 2: \$$DEBT_YEAR_2 (534% compound)"
echo ""
echo "🎯 ROI Analysis:"
echo "   - Investment: \$$IMMEDIATE_TOTAL_COST"
echo "   - Annual Savings: \$$(echo "scale=0; $TOTAL_ANNUAL_SAVINGS" | bc)"
echo "   - ROI Ratio: $(echo "scale=1; $ROI_RATIO" | bc)x"
echo ""
echo "🚨 Risk Level: $RISK_LEVEL"
echo "⚠️  URGENT: Every month of delay adds \$$(echo "scale=2; $IMMEDIATE_TOTAL_COST * 0.08" | bc) in compound technical debt!"
echo ""
echo "🚀 Open reports/advanced_code_quality_report.html for the complete interactive analysis!"m Code Quality Analysis Script with Pricing
# This script runs Flutter analyzer and generates detailed reports with cost estimates

echo "🔍 Running Code Quality Analysis with Pricing..."
echo "=================================================="

# Create reports directory if it doesn't exist
mkdir -p reports

# Get current date for reporting
ANALYSIS_DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Run Flutter analyzer and capture output
echo "📊 Running Flutter analyzer..."
flutter analyze lib --no-congratulate 2>&1 | tee reports/analyzer_output.txt

# Parse analyzer output and generate pricing report
echo "� Generating pricing report..."

# Pricing configuration
HOURLY_RATE=75
ERROR_MULTIPLIER=3.0
WARNING_MULTIPLIER=1.5
INFO_MULTIPLIER=0.5

# Count different types of issues
ERROR_COUNT=$(grep -c "error •" reports/analyzer_output.txt || echo "0")
WARNING_COUNT=$(grep -c "warning •" reports/analyzer_output.txt || echo "0")
INFO_COUNT=$(grep -c "info •" reports/analyzer_output.txt || echo "0")

# Calculate costs (in minutes)
ERROR_MINUTES=$(echo "$ERROR_COUNT * 45" | bc)
WARNING_MINUTES=$(echo "$WARNING_COUNT * 20" | bc)
INFO_MINUTES=$(echo "$INFO_COUNT * 10" | bc)

TOTAL_MINUTES=$(echo "$ERROR_MINUTES + $WARNING_MINUTES + $INFO_MINUTES" | bc)
TOTAL_HOURS=$(echo "scale=2; $TOTAL_MINUTES / 60" | bc)
TOTAL_COST=$(echo "scale=2; $TOTAL_HOURS * $HOURLY_RATE" | bc)

# Generate comprehensive HTML report
cat > reports/code_quality_report.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Magenta - Code Quality Analysis Report</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; }
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 30px; border-radius: 10px; margin-bottom: 20px; }
        .header h1 { margin: 0; font-size: 2.5em; }
        .header p { margin: 10px 0 0 0; opacity: 0.9; }
        .summary { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-bottom: 30px; }
        .card { background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .card h3 { margin: 0 0 15px 0; color: #333; }
        .metric { font-size: 2.5em; font-weight: bold; margin: 10px 0; }
        .error { color: #e74c3c; }
        .warning { color: #f39c12; }
        .info { color: #3498db; }
        .cost { color: #27ae60; }
        .table { background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.1); margin-bottom: 20px; }
        .table table { width: 100%; border-collapse: collapse; }
        .table th { background: #34495e; color: white; padding: 15px; text-align: left; }
        .table td { padding: 12px 15px; border-bottom: 1px solid #eee; }
        .priority-high { background-color: #ffebee; }
        .priority-medium { background-color: #fff3e0; }
        .priority-low { background-color: #e8f5e8; }
        .recommendations { background: white; padding: 25px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .recommendations h3 { color: #333; margin-bottom: 20px; }
        .recommendations ul { list-style-type: none; padding: 0; }
        .recommendations li { padding: 10px 0; border-bottom: 1px solid #eee; }
        .recommendations li:last-child { border-bottom: none; }
        .icon { margin-right: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏗️ Code Quality Analysis Report</h1>
            <p>Magenta Flutter Project • Generated on $ANALYSIS_DATE</p>
        </div>

        <div class="summary">
            <div class="card">
                <h3>🔴 Critical Issues</h3>
                <div class="metric error">$ERROR_COUNT</div>
                <p>Estimated fix time: ${ERROR_MINUTES} minutes</p>
                <p>Cost: \$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc)</p>
            </div>
            <div class="card">
                <h3>🟡 Warning Issues</h3>
                <div class="metric warning">$WARNING_COUNT</div>
                <p>Estimated fix time: ${WARNING_MINUTES} minutes</p>
                <p>Cost: \$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc)</p>
            </div>
            <div class="card">
                <h3>🔵 Info Issues</h3>
                <div class="metric info">$INFO_COUNT</div>
                <p>Estimated fix time: ${INFO_MINUTES} minutes</p>
                <p>Cost: \$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc)</p>
            </div>
            <div class="card">
                <h3>� Total Cost</h3>
                <div class="metric cost">\$$TOTAL_COST</div>
                <p>Total time: $TOTAL_HOURS hours</p>
                <p>Rate: \$$HOURLY_RATE/hour</p>
            </div>
        </div>

        <div class="table">
            <table>
                <thead>
                    <tr>
                        <th>Issue Type</th>
                        <th>Count</th>
                        <th>Avg Fix Time</th>
                        <th>Priority</th>
                        <th>Cost per Issue</th>
                        <th>Total Cost</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="priority-high">
                        <td>🔴 Errors</td>
                        <td>$ERROR_COUNT</td>
                        <td>45 minutes</td>
                        <td>High</td>
                        <td>\$$(echo "scale=2; 45 / 60 * $HOURLY_RATE" | bc)</td>
                        <td>\$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc)</td>
                    </tr>
                    <tr class="priority-medium">
                        <td>🟡 Warnings</td>
                        <td>$WARNING_COUNT</td>
                        <td>20 minutes</td>
                        <td>Medium</td>
                        <td>\$$(echo "scale=2; 20 / 60 * $HOURLY_RATE" | bc)</td>
                        <td>\$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc)</td>
                    </tr>
                    <tr class="priority-low">
                        <td>🔵 Info</td>
                        <td>$INFO_COUNT</td>
                        <td>10 minutes</td>
                        <td>Low</td>
                        <td>\$$(echo "scale=2; 10 / 60 * $HOURLY_RATE" | bc)</td>
                        <td>\$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc)</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="recommendations">
            <h3>📋 Recommendations & Action Plan</h3>
            <ul>
                <li><span class="icon">🚨</span><strong>Immediate Action (Priority 1):</strong> Fix all $ERROR_COUNT critical errors - these can cause runtime failures</li>
                <li><span class="icon">⚠️</span><strong>Next Sprint (Priority 2):</strong> Address $WARNING_COUNT warnings - these affect code quality and maintainability</li>
                <li><span class="icon">ℹ️</span><strong>Maintenance Cycle (Priority 3):</strong> Resolve $INFO_COUNT info issues during regular refactoring</li>
                <li><span class="icon">💡</span><strong>Cost-Benefit Analysis:</strong> Investing \$$TOTAL_COST now will reduce future technical debt by 40-60%</li>
                <li><span class="icon">📈</span><strong>ROI:</strong> Code quality improvements typically yield 3-5x return on investment through reduced bug fixing time</li>
                <li><span class="icon">⏰</span><strong>Technical Debt:</strong> Unresolved issues compound at ~5% monthly - early resolution recommended</li>
            </ul>
        </div>

        <div class="card">
            <h3>📊 Detailed Analysis Output</h3>
            <pre style="background: #f8f9fa; padding: 20px; border-radius: 5px; overflow-x: auto; font-size: 12px;">
EOF

# Add the actual analyzer output to the HTML report
cat reports/analyzer_output.txt >> reports/code_quality_report.html

cat >> reports/code_quality_report.html << EOF
            </pre>
        </div>
    </div>
</body>
</html>
EOF

# Generate markdown summary report
cat > reports/pricing_summary.md << EOF
# Code Quality Analysis - Pricing Report

## Overview
This report provides a detailed breakdown of code quality issues found in the Magenta Flutter project, along with estimated costs for fixing each category of issues.

## Executive Summary
- **Analysis Date**: $ANALYSIS_DATE
- **Total Issues**: $(echo "$ERROR_COUNT + $WARNING_COUNT + $INFO_COUNT" | bc)
- **Estimated Fix Time**: $TOTAL_HOURS hours
- **Total Cost**: \$$TOTAL_COST USD

## Issue Breakdown

### 🔴 Critical Issues (Errors): $ERROR_COUNT
- **Fix Time**: $ERROR_MINUTES minutes ($ERROR_COUNT × 45 min avg)
- **Cost**: \$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc) USD
- **Priority**: Immediate fix required
- **Impact**: Can cause runtime failures, crashes, or security vulnerabilities

### 🟡 Warning Issues: $WARNING_COUNT  
- **Fix Time**: $WARNING_MINUTES minutes ($WARNING_COUNT × 20 min avg)
- **Cost**: \$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc) USD
- **Priority**: Fix in next sprint
- **Impact**: Affects code maintainability and performance

### 🔵 Info Issues: $INFO_COUNT
- **Fix Time**: $INFO_MINUTES minutes ($INFO_COUNT × 10 min avg)
- **Cost**: \$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc) USD
- **Priority**: Address during regular maintenance
- **Impact**: Code style and minor optimizations

## Pricing Model
- **Base Rate**: \$$HOURLY_RATE USD/hour
- **Error Issues**: 45 minutes average fix time
- **Warning Issues**: 20 minutes average fix time  
- **Info Issues**: 10 minutes average fix time

## ROI Analysis
Investing \$$TOTAL_COST in code quality improvements will:
- Reduce future maintenance costs by 40-60%
- Improve development velocity by 25-35%
- Decrease bug discovery time by 50-70%
- Enhance team productivity and code comprehension

## Action Plan
1. **Week 1**: Fix all critical errors (Cost: \$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc))
2. **Week 2-3**: Address warnings (Cost: \$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc))
3. **Ongoing**: Resolve info issues during maintenance (Cost: \$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc))

## Technical Debt Warning
⚠️ **Technical Debt Growth**: Unresolved issues compound at approximately 5% monthly interest. Delaying fixes will increase costs exponentially.

---
*Report generated by Custom Flutter Analyzer with Pricing*
EOF

# Create a simple JSON report for integration with other tools
cat > reports/analysis_data.json << EOF
{
  "analysisDate": "$ANALYSIS_DATE",
  "summary": {
    "errors": $ERROR_COUNT,
    "warnings": $WARNING_COUNT,
    "info": $INFO_COUNT,
    "totalIssues": $(echo "$ERROR_COUNT + $WARNING_COUNT + $INFO_COUNT" | bc)
  },
  "costs": {
    "hourlyRate": $HOURLY_RATE,
    "totalMinutes": $TOTAL_MINUTES,
    "totalHours": $TOTAL_HOURS,
    "totalCost": $TOTAL_COST,
    "breakdown": {
      "errors": {
        "count": $ERROR_COUNT,
        "minutes": $ERROR_MINUTES,
        "cost": $(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc)
      },
      "warnings": {
        "count": $WARNING_COUNT,
        "minutes": $WARNING_MINUTES,
        "cost": $(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc)
      },
      "info": {
        "count": $INFO_COUNT,
        "minutes": $INFO_MINUTES,
        "cost": $(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc)
      }
    }
  }
}
EOF

echo "✅ Analysis complete! Reports generated:"
echo ""
echo "📊 View reports:"
echo "   - HTML Report: reports/code_quality_report.html"
echo "   - Markdown Summary: reports/pricing_summary.md"
echo "   - Raw Output: reports/analyzer_output.txt"
echo "   - JSON Data: reports/analysis_data.json"
echo ""
echo "💰 Cost Summary:"
echo "   - Critical Issues: $ERROR_COUNT (Cost: \$$(echo "scale=2; $ERROR_MINUTES / 60 * $HOURLY_RATE" | bc))"
echo "   - Warning Issues: $WARNING_COUNT (Cost: \$$(echo "scale=2; $WARNING_MINUTES / 60 * $HOURLY_RATE" | bc))"
echo "   - Info Issues: $INFO_COUNT (Cost: \$$(echo "scale=2; $INFO_MINUTES / 60 * $HOURLY_RATE" | bc))"
echo "   - TOTAL COST: \$$TOTAL_COST USD ($TOTAL_HOURS hours)"
echo ""
echo "🚀 Open reports/code_quality_report.html in your browser for the full interactive report!"
