<script lang="ts">
	import LoadingS from '$src/lib/Icons/LoadingS.svelte'
	import {
		deleteProductImage,
		downloadImage,
		getImage,
		type TransformOptions
	} from '$src/lib/supabase/api/storage/getImageUrl'
	import { Bucket } from '$src/lib/supabase/api/storage/uploader'
	import { browserSupabase } from '$src/lib/supabase/supabaseClient'
	import { blur } from 'svelte/transition'
	import type { ToggleControlType } from '../Behavior/toggleStore'
	import FullScreenModal from './atoms/FullScreenModal.svelte'
	import Button from '../Primitive/Button.svelte'
	import type { ProductImage } from '$src/lib/supabase/schema'
	import TrashIcon from '$src/lib/Icons/TrashIcon.svelte'
	import UploadIcon from '$src/lib/Icons/UploadIcon.svelte'
	import DownloadIcon from '$src/lib/Icons/DownloadIcon.svelte'
	import Edit from '$src/lib/Icons/Edit.svelte'

	export let productImage: ProductImage | undefined
	export let className = ''
	export let imageSize: TransformOptions = {} as TransformOptions

	const largerImage = async () =>
		await getImage(browserSupabase, {
			bucket: Bucket.ProductImages,
			filePath: productImage?.filePath,
			imageSize: { height: screen.height, width: screen.width, resize: 'contain' }
		})

	const deleteImageCallback = async () => {
		await deleteProductImage(browserSupabase, {
			bucket: Bucket.ProductImages,
			productImage
		})
	}

	let fullScreenView: ToggleControlType
	const fetchImageMetaData = async () => {}
</script>

<div class="flex justify-center w-full {className}">
	{#if productImage}
		{#await getImage( browserSupabase, { bucket: Bucket.ProductImages, filePath: productImage.filePath, imageSize } )}
			<LoadingS size={60}></LoadingS>
		{:then url}
			<button
				class="inline-block"
				on:click={() => {
					fullScreenView.open()
					fetchImageMetaData()
				}}
				transition:blur
			>
				<img src={url} alt="" />
			</button>
		{/await}
	{:else}
		<slot>No Image found</slot>
	{/if}
</div>

<FullScreenModal bind:active={fullScreenView} let:toggleControll>
	<!-- We are only getting images from the ProductImages bucket, this will be an issue at some point -->
	{#await largerImage()}
		<LoadingS></LoadingS>
	{:then url}
		<img src={url} alt="" />
	{/await}

	<p class="hidden lg:inline absolute top-5 text-white text-opacity-40">ESC to Close</p>
	<div class="meta-data absolute left-3 top-5 text-white">
		<p class="w-5/12">
			{productImage?.description ??
				'No Description alsdfkjaöslfdj asldfj asld kfjasj fkhaslkjdfhs klfgjsödlgfjfs dlgjö sd'}
		</p>
		<h3>
			{productImage?.title ?? 'No Title'}
		</h3>
	</div>

	<div
		class="top-controll-panel absolute top-5 right-1/2 translate-x-1/2 w-full flex flex-col gap-2"
	>
		<div class="flex justify-end">
			<Button
				command={deleteImageCallback}
				className="bg-primary-700 bg-opacity-60 text-white rounded-lg
					w-20 h-10 border border-red-400"
			>
				<TrashIcon className="stroke-red-400"></TrashIcon>
			</Button>
		</div>
	</div>
	<div
		class="bottom-controll-panel absolute bottom-5 right-1/2 translate-x-1/2 w-full flex flex-col gap-2"
	>
		<div class="flex justify-end gap-2">
			<Button
				command={toggleControll.close}
				className=" bg-primary-700 bg-opacity-60 text-white rounded-lg
							w-20 h-10 border border-white"
			>
				<p>Close</p>
			</Button>
		</div>
		<div class="flex justify-end gap-2">
			{#if productImage?.coverImage}
				<Button
					command={toggleControll.close}
					className=" bg-primary-700 bg-opacity-60 text-white rounded-lg
					w-20 h-10 border border-white"
				>
					<UploadIcon className="stroke-white" />
				</Button>
			{/if}
			<Button
				command={async () => {
					try {
						const file = await downloadImage(browserSupabase, {
							bucket: Bucket.ProductImages,
							productImage
						})
						const a = document.createElement('a')
						a.href = window.URL.createObjectURL(file)
						a.download = productImage?.title ?? 'Image'
						a.target = '_blank'
						a.click()
					} catch (error) {
						alert(error)
					}
				}}
				className=" bg-primary-700 bg-opacity-60 text-white rounded-lg
					w-20 h-10 border border-white"
			>
				<DownloadIcon className="stroke-white" />
			</Button>

			<Button
				command={toggleControll.close}
				className=" bg-primary-700 bg-opacity-60 text-white rounded-lg
								w-20 h-10 border border-white"
			>
				<Edit className="stroke-white" />
			</Button>
		</div>
	</div>
</FullScreenModal>
