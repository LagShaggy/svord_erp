<script>
	import { createToggleControl } from '$src/lib/UI/Behavior/toggleStore.js'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'

	export let data
	let { session, message } = data
	let user = session?.user

	const edit = createToggleControl(false)
</script>

<div class="px-5">
	<!-- // TODO: change this to ActionButton -->
	<div class="flex flex-row justify-end mb-5">
		<button class="clickable h-10 w-20" on:click={edit.toggle}> Edit </button>
	</div>

	{#if $edit}
		<Form>
			<InputFile name="picture">Profile Picture</InputFile>
			<InputText name="firstName">First Name</InputText>
			<InputText name="lastName">Last Name</InputText>
			<SubmitButton className="w-min self-center px-4 py-2">Update</SubmitButton>
		</Form>
	{:else}
		<div>
			{message}
		</div>
		<div>
			{session?.user.email}
			<br />
			{session?.user.aud}
		</div>
	{/if}
</div>
