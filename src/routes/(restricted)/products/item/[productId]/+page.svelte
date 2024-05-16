<script lang="ts">
	import Accordion from '$src/lib/UI/Accordion/Accordion.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import type { FormEventHandler } from 'svelte/elements'
	import type { PageData } from './$types'

	export let data: PageData
	let { product, alternativeProducts, components } = data
	$: ({ product, alternativeProducts, components } = data)

	const onInput = () => {
		const form = document.getElementById('form') as HTMLFormElement
		form.submit()
		console.log('uploaded file')
	}
</script>

<BasePage title={`${product?.abbreviation} - ${product?.name}`}>
	<div class="flex justify-between w-full items-center">
		<p class="my-5">
			{product?.description}
		</p>
		<Form id="form" action="?/uploadImage" enctype="multipart/form-data" on:change={onInput}>
			<InputFile name="productPicture">Picture</InputFile>
		</Form>
	</div>

	<Accordion
		props={{
			title: 'Product Informartion',
			shortDescr: 'Here you can see an overview of the basic product properties'
		}}
	></Accordion>
	<Accordion
		props={{
			title: 'Price Information',
			shortDescr: 'See product workflows'
		}}
	></Accordion>
	{#if components}
		<Accordion props={{ title: 'Components' }}>
			{#each components as { component: { abbreviation, name } }}
				<div>
					{abbreviation} - {name}
				</div>
			{/each}
		</Accordion>
	{/if}
	{#if alternativeProducts}
		<Accordion props={{ title: 'Alternative Products' }}>
			{#each alternativeProducts as { abbreviation, name }}
				<div>
					{abbreviation} - {name}
				</div>
			{/each}
		</Accordion>
	{/if}
	<Accordion
		props={{
			title: 'People of Interest',
			shortDescr: 'See product workflows'
		}}
	></Accordion>
</BasePage>
