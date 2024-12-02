<script lang="ts">
	import UploadIcon from '$src/lib/Icons/UploadIcon.svelte'
	import Accordion from '$src/lib/UI/Accordion/Accordion.svelte'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import InputRadio from '$src/lib/UI/Primitive/Form/InputRadio.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'
	import TextArea from '$src/lib/UI/Primitive/Form/TextArea.svelte'
	import type { ActionData, PageData } from './$types'

	export let data: PageData
	let { categories } = data

	export let form: ActionData

	let image = $state<FileList>({} as FileList)
	$effect(() => console.log(image))
</script>

<Form action={'?/createProduct'} className="px-5 md:w-1/2">
	<h1>Create a new Product</h1>
	<div class="border-2 border-secondary-500 rounded-lg">
		<InputFile bind:file={image}><UploadIcon /> Cover Image</InputFile>
	</div>
	<InputText name={'name'} value={form?.name ?? ''} required>Product Name</InputText>
	<TextArea
		name={'description'}
		className="border rounded-md"
		placeholder="Write a product description"
	/>
	<InputRadio options={categories} name="product_category">Product Category</InputRadio>

	<Accordion
		props={{
			title: 'Add new Product Category',
			expanded: categories?.length == 0,
			shortDescr: 'new product'
		}}
	>
		<InputText name={'newCategory'} value={form?.category ?? ''}>Category Name</InputText>
		<SubmitButton formaction="?/createProductCategory">New Product Category</SubmitButton>
	</Accordion>

	<br />
	<SubmitButton>Create</SubmitButton>
</Form>
