<script>
	import '../app.css'
	import {
		Navbar,
		NavBrand,
		NavLi,
		NavUl,
		NavHamburger,
		Dropdown,
		DropdownItem,
		Chevron
	} from 'flowbite-svelte'

	//head
	let title
	$: title = title + '- Oederlin Studio'

	//rendering
	export const prerender = true
	export const ssr = false
</script>

<Navbar
	class="sticky top-0 z-10 bg-slate-200 bg-opacity-90"
	let:hidden
	let:toggle
>
	<NavBrand href="/">
		<img
			src="/favicon.png"
			class="mr-3 h-6 sm:h-9"
			alt="SwimSuit"
		/>
		<span
			class="self-center whitespace-nowrap font-oswald text-2xl font-semibold dark:text-white"
		>
			œderlin
		</span>
	</NavBrand>
	<NavHamburger on:click={toggle} />
	<NavUl {hidden}>
		<NavLi href="/" active={true}>Home</NavLi>
		<NavLi href="/products">Products</NavLi>

		<NavLi id="nav-menu1" class="cursor-pointer"
			><Chevron aligned>Orders</Chevron></NavLi
		>
		<NavLi href="/users">Users</NavLi>
		<Dropdown triggeredBy="#nav-menu1" class="z-20 w-44">
			<DropdownItem href="/orders/create"
				>Create</DropdownItem
			>
			<DropdownItem href="/orders/view"
				>View All</DropdownItem
			>
		</Dropdown>
	</NavUl>
</Navbar>

<!--The pages get loaded here in <slot /> -->
<div
	class="mx-auto h-min bg-slate-300 py-6 px-8 pb-16 font-oswald shadow-xl"
>
	<slot />
	<div class="fixed bottom-12 right-12 ">SOME UTILITY</div>
</div>

<div hidden class="h-screen bg-red-500">SOME ELEMENT</div>

<!--The Footer -->
<div class="my-auto flex h-52 justify-center bg-slate-200">
	<div class="w-1/2">Some Information</div>
	<div class="w-1/2">Company information</div>
</div>

<style>
</style>
