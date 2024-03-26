<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import AccountRow from '$lib/UI/Table/Rows/AccountRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'

	export let data
	let { accounts } = data
	$: ({ accounts } = data)
	$: console.log(`We found ${accounts?.length} Accounts`)
</script>

<BasePage title="PEOPLE">
	<Table items={accounts} let:item let:index>
		<AccountRow {item} {index} />
	</Table>
</BasePage>
