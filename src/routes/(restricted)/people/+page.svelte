<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import AccountRow from '$lib/UI/Table/Rows/AccountRow.svelte'
	import Table from '$lib/UI/Table/Table.svelte'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButton'
	import Add from '$src/lib/Icons/Add.svelte'
	import { onDestroy, onMount } from 'svelte'
	import ModalWindow from '$src/lib/UI/Modal/ModalWindow.svelte'
	import CreateAccount from '$src/lib/People/Account/CreateAccount.svelte'
	import type { ToggleControlType } from '$src/lib/UI/Behavior/toggleStore.js'
	import CreateContact from '$src/lib/People/Contact/CreateContact.svelte'
	import RoundButton from '$src/lib/UI/Primitive/RoundButton.svelte'
	import X from '$src/lib/Icons/X.svelte'

	export let data
	let { accounts } = data
	$: ({ accounts } = data)

	// modal
	let createAccount: ToggleControlType
	let createContact: ToggleControlType

	onMount(() => {
		createAccount.subscribe((v) => {
			if (v == true && $createContact == true) {
				console.log('closing Contact Modal')
				return createContact.close()
			}
		})
		createContact.subscribe((v) => {
			if (v == true && $createAccount == true) {
				console.log('closing Account Modal')
				return createAccount.close()
			}
		})
		actionStore.add({
			name: 'Add Account',
			command: createAccount.toggle,
			img: Add
		})
		actionStore.add({
			name: 'Add Contact',
			command: createContact.toggle,
			img: Add
		})
	})
	onDestroy(() => {
		actionStore.reset()
	})
</script>

<ModalWindow bind:active={createAccount} let:toggleControll>
	<CreateAccount account={null}></CreateAccount>
	<RoundButton
		command={toggleControll.close}
		className="absolute -bottom-5 right-1/2 translate-x-1/2"
	>
		<X />
	</RoundButton>
</ModalWindow>
<ModalWindow bind:active={createContact} let:toggleControll>
	<CreateContact contact={null}></CreateContact>
	<RoundButton
		command={toggleControll.close}
		className="absolute -bottom-5 right-1/2 translate-x-1/2"
	>
		<X />
	</RoundButton>
</ModalWindow>

<BasePage title="PEOPLE" className="-mx-5">
	<Table items={accounts} let:item let:index>
		<AccountRow {item} {index} />
	</Table>
</BasePage>
