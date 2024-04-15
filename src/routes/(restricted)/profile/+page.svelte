<script lang="ts">
	import { createToggleControl } from '$src/lib/UI/Behavior/toggleStore'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'
	import { blur } from 'svelte/transition'
	import { actionStore } from '$src/lib/UI/ActionButton/actionButton'
	import { onDestroy, onMount } from 'svelte'
	import Profile from '$src/lib/Profile/Profile.svelte'
	import type { PageData } from './$types'
	import Edit from '$src/lib/Icons/Edit.svelte'

	export let data: PageData
	let { profile, profilePicture } = data
	$: ({ profile, profilePicture } = data)

	const edit = createToggleControl(false)

	const editAction = {
		command: () => {
			edit.toggle()
			actionStore.reset()
		},
		img: Edit
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
			<Form enctype="multipart/form-data">
				<InputFile>Profile Picture</InputFile>
				<InputText name="firstName" value={profile?.firstname ?? ''}>First Name</InputText>
				<InputText name="lastName" value={profile?.lastname ?? ''}>Last Name</InputText>
				<SubmitButton className="w-min self-center px-4 py-2">Update</SubmitButton>
			</Form>
		</span>
	{:else}
		<span transition:blur>
			<Profile {profile} {profilePicture}></Profile>
		</span>
	{/if}
</div>
