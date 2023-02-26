<script>
	import '../app.css';
	import {
		Navbar,
		NavBrand,
		NavLi,
		NavUl,
		NavHamburger,
		Dropdown,
		DropdownItem,
		Chevron
	} from 'flowbite-svelte';

	//head
	let title;
	$: title = title + '- Oederlin Studio';

	//rendering
	export const prerender = true;
	export const ssr = false;
</script>

<Navbar class="sticky top-0" let:hidden let:toggle>
	<NavBrand href="/">
		<img
			src="/favicon.png"
			class="mr-3 h-6 sm:h-9"
			alt="SwimSuit"
		/>
		<span
			class="font-body self-center whitespace-nowrap text-xl font-semibold dark:text-white"
		>
			Œderlin
		</span>
	</NavBrand>
	<NavHamburger on:click={toggle} />
	<NavUl {hidden}>
		<NavLi href="/" active={true}>Home</NavLi>
		<NavLi id="nav-menu1" class="cursor-pointer"
			><Chevron aligned>Orders</Chevron></NavLi
		>
		<NavLi href="/products">Products</NavLi>
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

<div
	class="max-w-8xl my-6 mx-auto h-screen pl-4 pr-4 font-oswald shadow-xl"
>
	<slot />
</div>

<div class="h-screen bg-red-500">
	SOME ELEMENT
	<div />
</div>

<div class="fixed bottom-10 right-10">SOME ELEMENT</div>

<style>
</style>
