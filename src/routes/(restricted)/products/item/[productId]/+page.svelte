<script lang="ts">
	import LoadingS from '$src/lib/Icons/LoadingS.svelte'
	import Accordion from '$src/lib/UI/Accordion/Accordion.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import DisplayImage from '$src/lib/UI/Files/DisplayImage.svelte'
	import Form from '$src/lib/UI/Primitive/Form/Form.svelte'
	import InputFile from '$src/lib/UI/Primitive/Form/InputFile.svelte'
	import { getImageURL } from '$src/lib/supabase/api/storage/getImageUrl'
	import { Bucket } from '$src/lib/supabase/api/storage/uploader'
	import type { PageData } from './$types'

	export let data: PageData
	let { product, alternativeProducts, components } = data
	$: ({ product, alternativeProducts, components } = data)

	let coverImagePath = product?.product_image.filter((i) => i.coverImage)[0].filePath
	let otherImagePaths = product?.product_image.filter((i) => !i.coverImage).map((i) => i.filePath)

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
			title: 'Images',
			shortDescr: 'See product workflows'
		}}
	></Accordion>
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
