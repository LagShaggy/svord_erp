<script>
	import { createToggleControl } from '$src/lib/UI/Behavior/toggleStore'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'
	import { blur } from 'svelte/transition'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButtonStore'
	import { onDestroy, onMount } from 'svelte'

	export let data
	let { session, message } = data
	let user = session?.user

	const edit = createToggleControl(false)

	const editAction = {
		command: () => {
			edit.toggle()
			actionStore.reset()
		},
		img: '/icons/dollar-sign.svg'
	}

	const goBack = () => {
		edit.close()
		actionStore.add(editAction)
	}

	onMount(() => actionStore.add(editAction))

	onDestroy(() => actionStore.reset())
</script>

<div class="px-5">
	{#if $edit}
		<div class="flex flex-row justify-start mb-5">
			<button on:click={goBack}>
				<img src="/icons/chevron-left.svg" class="" alt="back" />
			</button>
		</div>
		<span transition:blur>
			<Form>
				<InputFile name="picture">Profile Picture</InputFile>
				<InputText name="firstName">First Name</InputText>
				<InputText name="lastName">Last Name</InputText>
				<SubmitButton className="w-min self-center px-4 py-2">Update</SubmitButton>
			</Form>
		</span>
	{:else}
		<span transition:blur>
			<div>
				{message}
			</div>
			<div>
				{session?.user.email}
				<br />
				{session?.user.aud}
			</div>
		</span>
	{/if}
</div>
