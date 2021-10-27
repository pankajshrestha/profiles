# -- Function as Alias START --#

function awsathqid() {
aws athena get-query-execution --query-execution-id $1
}

function cron-show-description() {
    python -c "from cron_descriptor import get_description; print(get_description('$1'))"
}
alias csd="cron-show-description"

function rich-cat-csv() {
    python3 -c "
import pandas as pd
from rich.console import Console
from rich.table import Table

console = Console()

table = Table(show_header=True, header_style='bold magenta')

df = pd.read_csv('$1')
for col in df.columns:
    table.add_column(col)


for row in df.itertuples(index=False, name=None):
    row = [str(item) for item in row]
    table.add_row(*list(row))

console.print(table)
"
}
alias rcat="rich-cat-csv"

# -- Function as Alias END --#
