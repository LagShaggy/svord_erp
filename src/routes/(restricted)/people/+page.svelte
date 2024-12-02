<script lang="ts">
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
	import { cubicInOut } from 'svelte/easing'
	import { crossfade } from 'svelte/transition'
	import ContactRow from '$src/lib/UI/Table/Rows/ContactRow.svelte'

	export let data
	let { accounts, contacts } = data
	$: ({ accounts, contacts } = data)

	// Tab Animations
	const [send, receive] = crossfade({
		duration: 250,
		easing: cubicInOut
	})
	let tabs: string[] = ['ACCOUNTS', 'CONTACTS']
	let activeTabIndex: number = 0
	let buttons: HTMLElement[] = []
	$: ({ left, top, width, height } = (() => {
		const button = buttons[activeTabIndex]
		if (button == null) return {} // Not mounted yet

		return button.getBoundingClientRect()
	})())

	// modal
	let createAccount: ToggleControlType
	let createContact: ToggleControlType

	onMount(() => {
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

<div class="grid grid-cols-2 justify-between isolate mb-2">
	<div
		class="absolute bg-primary-50 rounded-full transition-all"
		style="
            left: {left}px;
            top: {top}px;
            width: {width}px;
            height: {height}px;
        "
	/>
	{#each tabs as tab, i}
		<button bind:this={buttons[i]} on:click={() => (activeTabIndex = i)} class="z-10 mx-2 my-5">
			<h1 class="px-4 py-2 {activeTabIndex === i ? '' : 'text-gray-300'}">{tab}</h1>
		</button>
	{/each}
</div>
<div class="transition-all">
	{#if activeTabIndex == 0}
		<Table items={accounts} let:item let:index>
			<AccountRow {item} {index} />
		</Table>
	{:else}
		<Table items={contacts} let:item let:index>
			<ContactRow {item} {index} />
		</Table>people page
	{/if}
</div>
