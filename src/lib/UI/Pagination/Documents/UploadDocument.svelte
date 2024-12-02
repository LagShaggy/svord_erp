<script lang="ts">
	import FileIcon from '$src/lib/Icons/FileIcon.svelte'
	import UploadIcon from '$src/lib/Icons/UploadIcon.svelte'
	import Form from '../../Primitive/Form/Form.svelte'
	import InputFile from '../../Primitive/Form/InputFile.svelte'

	export let action = '?/uploadDocument'

	const onInput = () => {
		const form = document.getElementById('form') as HTMLFormElement
		form.requestSubmit()
	}
</script>

<Form id="form" {action} enctype="multipart/form-data" on:input={onInput} className="block">
	<InputFile>
		<UploadIcon />
		<slot>Upload Document</slot>
		<FileIcon />
	</InputFile>
</Form>
