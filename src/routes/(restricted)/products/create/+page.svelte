<script lang="ts">
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputRadio from '$src/lib/UI/Primitive/Form/InputRadio.svelte'
	import InputText from '$src/lib/UI/Primitive/Form/InputText.svelte'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'
	import type { ActionData, PageData } from './$types'

	export let data: PageData
	let { categories } = data
	$: ({ categories } = data)

	export let form: ActionData
</script>

<Form action={'?/createProduct'}>
	<h1>Create a new Product</h1>
	<InputText name={'name'} type={'text'} value={form?.name ?? ''}>Name</InputText>
	<InputText name={'description'} type={'text'} value={form?.description ?? ''}
		>Description</InputText
	>
	<InputRadio options={categories} name="product_category">Product Category</InputRadio>
	Add new Product Category
	<InputText name={'newCategory'} type={'text'} value={form?.category ?? ''}>
		Product Category Name
	</InputText>
	<SubmitButton formaction="?/createProductCategory">New Product Category</SubmitButton>

	<br />
	<SubmitButton>Create</SubmitButton>
</Form>
