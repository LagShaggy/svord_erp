<script lang="ts">
	import LoadingS from '$src/lib/Icons/LoadingS.svelte'
	import Accordion from '$src/lib/UI/Accordion/Accordion.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import DisplayImage from '$src/lib/UI/Files/DisplayImage.svelte'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { product, alternativeProductsPromise, componentsPromise } = data
	$: ({ product, alternativeProductsPromise, componentsPromise } = data)

	let coverImagePath = product?.product_image.filter((i) => i.coverImage)[0]?.filePath
	let otherImgePaths = product?.product_image.filter((i) => !i.coverImage).map((i) => i.filePath)

	console.log(coverImagePath)
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
		<DisplayImage {coverImagePath} className="aspect-square md:w-1/2">
			<Form id="form" action="?/uploadCoverImage" enctype="multipart/form-data" on:input={onInput}>
				<InputFile>Picture</InputFile>
			</Form>
		</DisplayImage>
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
	{#await componentsPromise}
		<LoadingS></LoadingS>
	{:then components}
		{#if components?.length != null}
			<Accordion props={{ title: 'Components' }}>
				{#each components as { component: { abbreviation, name } }}
					<div>
						{abbreviation} - {name}
					</div>
				{/each}
			</Accordion>
		{/if}
	{/await}
	{#await alternativeProductsPromise}
		<LoadingS></LoadingS>
	{:then alternativeProducts}
		{#if alternativeProducts != null}
			<Accordion props={{ title: 'Alternative Products' }}>
				{#each alternativeProducts as { abbreviation, name }}
					<div>
						{abbreviation} - {name}
					</div>
				{/each}
			</Accordion>
		{/if}
	{/await}

	<Accordion
		props={{
			title: 'Images',
			shortDescr: 'See product workflows'
		}}
	>
		{#each otherImgePaths as image}
			<div></div>
		{/each}
	</Accordion>
	<Accordion
		props={{
			title: 'Documents',
			shortDescr: 'See product workflows'
		}}
	></Accordion>
	<Accordion
		props={{
			title: 'People of Interest',
			shortDescr: 'See product workflows'
		}}
	></Accordion>
</BasePage>
