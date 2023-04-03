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
		Chevron,
		A
	} from 'flowbite-svelte'
	import Alert from '$lib/Banner/Alert.svelte'
</script>

<Alert />

<Navbar
	class="sticky top-0 z-10 bg-slate-200 bg-opacity-90"
	let:hidden
	let:toggle
>
	<NavBrand href="/">
		<img
			src="/favicon.png"
			class="mr-3 h-6 sm:h-9"
			alt="SwimSuit Icon"
		/>
		<span
			class="self-center whitespace-nowrap font-oswald text-2xl font-semibold dark:text-white"
		>
			œderlin
		</span>
	</NavBrand>
	<NavHamburger on:click={toggle} />
	<NavUl {hidden}>
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
</div>

<style>
</style>
