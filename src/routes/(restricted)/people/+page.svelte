<script>
	import BasePage from '$lib/UI/BasePage.svelte'
	import AccountRow from '$lib/UI/Table/Rows/AccountRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'

	export let data
	let { accounts } = data
	$: ({ accounts } = data)
</script>

<BasePage title="PEOPLE" description="here you can write a littlebit about the page itself">
	<Table let:item let:index items={accounts}>
		<AccountRow {item} {index} />
	</Table>
</BasePage>
