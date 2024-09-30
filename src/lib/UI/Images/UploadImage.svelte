<script lang="ts">
	import UploadIcon from '$src/lib/Icons/UploadIcon.svelte'
	import Form from '../Primitive/Form/Form.svelte'
	import InputFile from '../Primitive/Form/InputFile.svelte'

	export let action = '?/uploadImage'

	const onInput = () => {
		const form = document.getElementById('form') as HTMLFormElement
		form.requestSubmit()
		console.log('uploaded file')
	}
</script>

<Form id="form" {action} enctype="multipart/form-data" on:input={onInput} className="block">
	<InputFile>
		<UploadIcon />
		<slot>Upload Image</slot>
	</InputFile>
</Form>
