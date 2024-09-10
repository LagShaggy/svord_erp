<script lang="ts">
	import LoadingS from '$src/lib/Icons/LoadingS.svelte'
	import Accordion from '$src/lib/UI/Accordion/Accordion.svelte'
	import BasePage from '$src/lib/UI/BasePage.svelte'
	import DisplayImage from '$src/lib/UI/Images/DisplayImage.svelte'
	import UploadImage from '$src/lib/UI/Images/UploadImage.svelte'
	import type { PageData } from './$types'

	export let data: PageData
	let { product, alternativeProductsPromise, componentsPromise } = data
	$: ({ product, alternativeProductsPromise, componentsPromise } = data)

	let coverImage = product?.product_image.filter((i) => i.coverImage)[0]
</script>

<BasePage
	title={product?.abbreviation ? `${product.abbreviation} - ${product?.name}` : `${product?.name}`}
>
	<div class="grid md:grid-cols-2 row-span-2 justify-center items-center">
		<DisplayImage
			productImage={coverImage}
			className="md:row-span-3 row-span-1 min-h-40"
			imageSize={{ height: 500, width: 500, resize: 'cover' }}
		>
			<UploadImage action="?/uploadCoverImage">Cover Image</UploadImage>
		</DisplayImage>
		<section class="my-5 px-1">
			<h4>Description</h4>
			<p>
				{product?.description}
			</p>
		</section>
		<section class="my-5 px-1 md:row-span-2">
			<h4>Product Information</h4>
			<p>
				Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima sed blanditiis a, inventore
				voluptatibus facilis? Repellat velit vel, ducimus, ab voluptate laudantium, dignissimos
				recusandae sunt enim optio reiciendis hic repellendus. Lorem ipsum dolor sit amet
				consectetur adipisicing elit. Nesciunt perspiciatis adipisci impedit praesentium fugit ab,
				eum placeat pariatur neque eveniet quis quibusdam odio doloremque voluptate molestiae
				explicabo necessitatibus itaque repellendus.
			</p>
		</section>
	</div>
	<Accordion
		props={{
			title: 'Images'
		}}
	>
		<UploadImage>Product Image</UploadImage>

		{#if product?.product_image && product?.product_image.length !== 0}
			<section class="grid grid-cols-4 gap-2 mt-5">
				{#each product?.product_image as productImage}
					<DisplayImage {productImage} imageSize={{ height: 200, width: 200, resize: 'cover' }} />
				{/each}
			</section>
		{:else}
			<div class="block text-center mt-6">Currently no Images</div>
		{/if}
	</Accordion>

	<Accordion
		props={{
			title: 'Price Information'
		}}
	></Accordion>

	<Accordion
		props={{
			title: 'Warehouse'
		}}
	>
		<h2>Documents</h2>
	</Accordion>
	<Accordion
		props={{
			title: 'Documents'
		}}
	>
		<h2>Documents</h2>
	</Accordion>
	<Accordion
		props={{
			title: 'People of Interest'
		}}
	>
		<h2>People</h2>
	</Accordion>
	{#await componentsPromise}
		<!-- <LoadingS></LoadingS> -->
	{:then components}
		{#if components && components?.length !== 0}
			<Accordion props={{ title: 'Components' }}>
				{#each components as { abbreviation, name }}
					<div>
						{abbreviation} - {name}
					</div>
				{/each}
			</Accordion>
		{/if}
	{:catch error}
		No Components for this Product
	{/await}

	{#await alternativeProductsPromise}
		<!-- <LoadingS></LoadingS> -->
	{:then alternativeProducts}
		{#if alternativeProducts && alternativeProducts?.length !== 0}
			<Accordion props={{ title: 'Alternative Products' }}>
				{#each alternativeProducts as { abbreviation, name }}
					<div>
						{abbreviation} - {name}
					</div>
				{/each}
			</Accordion>
		{/if}
	{/await}
</BasePage>
