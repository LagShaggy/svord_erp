<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import AccountRow from '$lib/UI/Table/Rows/AccountRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButton'
	import Add from '$src/lib/Icons/Add.svelte'
	import { onDestroy } from 'svelte'

	export let data
	let { accounts } = data
	$: ({ accounts } = data)

	actionStore.add({ name: 'Add Account', command: () => console.log('clicked Account'), img: Add })
	actionStore.add({ name: 'Add Contact', command: () => console.log('clicked Contact'), img: Add })
	onDestroy(() => {
		actionStore.reset()
	})
</script>

<BasePage title="PEOPLE" className="-mx-5">
	<Table items={accounts} let:item let:index>
		<AccountRow {item} {index} />
	</Table>
</BasePage>
