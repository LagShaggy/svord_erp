<script lang="ts">
	import JsonLister from '$lib/Items/JsonLister.svelte'
	import { Badge, Tabs, TabItem } from 'flowbite-svelte'

	/** @type {import('./$types').PageData} */
	export let data: any
	let { item } = data
	$: ({ item } = data)

	let variants = ['something', 'somethingElse']
</script>

<a class="absolute z-10" href="/products">
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width="40"
		height="40"
		viewBox="0 0 24 24"
	>
		<path
			fill="currentColor"
			d="m11.3 12l3.5-3.5c.4-.4.4-1 0-1.4c-.4-.4-1-.4-1.4 0l-4.2 4.2c-.4.4-.4 1 0 1.4l4.2 4.2c.2.2.4.3.7.3c.3 0 .5-.1.7-.3c.4-.4.4-1 0-1.4L11.3 12z"
		/>
	</svg>
</a>

<div
	class="relative mb-4 inline-flex w-full place-items-center items-center justify-center"
>
	<h1 class="">{item.name}</h1>
</div>

<div
	class="flex flex-col justify-around justify-items-start sm:flex-row"
>
	<div class="sm:w-1/3">
		<div class="mb-2">
			<h2>Basic Information</h2>
			<JsonLister description={item.description} />
		</div>
		<div class="border-b">
			<h2>Variants</h2>
			{#each variants as variant}
				<p>
					{variant}
				</p>
			{/each}
		</div>
	</div>
	<div class="p-5 sm:w-2/3">
		<Tabs
			style="underline"
			defaultClass="flex space-x-2"
			activeClasses="p-4 text-blue-600 rounded-t-lg"
			contentClass="p-4 bg-gray-50 rounded-lg dark:bg-gray-800 mt-4"
			inactiveClasses="p-4 text-red-800 rounded-t-lg hover:text-gray-600 hover:bg-gray-50 dark:text-gray-400 dark:hover:bg-gray-800 dark:hover:text-gray-300"
		>
			<TabItem open title="News">
				<p class="text-sm">
					<b>News:</b> Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua.
				</p>
			</TabItem>
			<TabItem title="Sales">
				<p class="text-sm">
					<b>Sales:</b> Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua.
				</p>
			</TabItem>
			<TabItem title="Logistics">
				<p>
					<b>Logistics:</b> Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua.
				</p>
			</TabItem>

			<TabItem disabled>
				<span
					slot="title"
					class="text-gray-400 dark:text-gray-500"
					>Next Feature</span
				>
				<p class="text-sm text-gray-500 dark:text-gray-400">
					<b>Disabled:</b> Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua.
				</p>
			</TabItem>
		</Tabs>
	</div>
</div>
