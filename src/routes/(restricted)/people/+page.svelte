<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import AccountRow from '$lib/UI/Table/Rows/AccountRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButton'
	import Add from '$src/lib/Icons/Add.svelte'
	import { onDestroy, onMount } from 'svelte'
	import ModalWindow from '$src/lib/UI/Modal/ModalWindow.svelte'
	import CreateAccount from '$src/lib/Account/CreateAccount.svelte'
	import type { ToggleControlType } from '$src/lib/UI/Behavior/toggleStore.js'

	export let data
	let { accounts } = data
	$: ({ accounts } = data)

	// modal
	let createAccountToggle: ToggleControlType

	onMount(() => {
		actionStore.add({
			name: 'Add Account',
			command: createAccountToggle.toggle,
			img: Add
		})
		actionStore.add({
			name: 'Add Contact',
			command: () => console.log('clicked Contact'),
			img: Add
		})
	})
	onDestroy(() => {
		actionStore.reset()
	})
</script>

<ModalWindow bind:active={createAccountToggle}>
	<CreateAccount account={null}></CreateAccount>
</ModalWindow>
<BasePage title="PEOPLE" className="-mx-5">
	<Table items={accounts} let:item let:index>
		<AccountRow {item} {index} />
	</Table>
</BasePage>
