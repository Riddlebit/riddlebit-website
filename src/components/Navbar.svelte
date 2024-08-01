<script>
  import { onMount } from 'svelte';

  let navOpen = false;
  let mobileNav = false;
  let scrollY, isHomepage;

  const toggleNav = () => {
    navOpen = !navOpen;
  };

  const mobileQueryChanged = (e) => {
    mobileNav = e.matches;
    navOpen = false;
  };

  onMount(() => {
    const mobileQuery = window.matchMedia('(max-width: 730px)');
    mobileQueryChanged(mobileQuery);
    mobileQuery.addEventListener("change", mobileQueryChanged);
    isHomepage = window.location.pathname === "/";
  });

  // Navbar data
  const navbarHeight = 60;
  const navItems = [
    { label: 'Home', href: '/#header' },
    { label: 'About Us', href: '/#about' },
    { label: 'Games', href: '/#games' },
    { label: 'Our Team', href: '/#our-team' },
    { label: 'Careers', href: 'https://thehub.io/startups/riddlebit-software' }
  ];
</script>

<svelte:window bind:scrollY />

<nav
  class={`navbar ${navOpen && mobileNav ? "open" : ""} ${
    scrollY > navbarHeight || !isHomepage ? "opaque" : ""
  }`}
  style="--navbar-height:{`${navbarHeight}px`}"
>
  {#if mobileNav}
    <button on:click={toggleNav} class="nav-toggle-button">
      <!-- Open mobile menu icon -->
      <svg class={`toggle-button ${!navOpen ? "active" : ""}`}>
        <use href="/icons.svg#bars" />
      </svg>

      <!-- Close mobile menu icon -->
      <svg class={`toggle-button ${navOpen ? "active" : ""}`}>
        <use href="/icons.svg#xmark" />
      </svg>
    </button>
  {/if}

  <ul class={`navlinks ${mobileNav ? "mobile" : ""}`}>
    <!-- Navbar Links -->
    {#each navItems as item}
      <li class="navlink">
        <a on:click={() => {toggleNav(); _paq.push(['trackEvent', 'Navigation', 'Navbar Click', item.label])}} href={item.href} rel="noopener" aria-label={item.label}>{item.label}</a>
      </li>
    {/each}
  </ul>

</nav>

<style>
  .navbar {
    position: fixed;
    width: 100%;
    height: var(--navbar-height);
    padding: 0;
    margin: 0;
    top: 0;
    z-index: 1000;
    transition: 0.3s;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .navbar.opaque {
    background-color: #252525;
  }

  .navbar.open {
    height: 100vh;
    background-color: #252525;
  }

  .nav-toggle-button {
    width: 100%;
    border: none;
    height: var(--navbar-height);
    background-color: rgba(0, 0, 0, 0);
  }

  .navlinks {
    margin: 0;
    padding: 0;
    width: 100%;
    max-width: 1000px;
    height: 100%;
    list-style: none;
    display: flex;
    flex-direction: row;
  }

  .navlinks button {
    background-color: rgba(0, 0, 0, 0);
  }

  .navlinks.mobile {
    flex-direction: column;
    justify-content: start;
    overflow: hidden;
  }

  .navlink {
    padding: 0;
    border: 0;
    width: 100%;
    min-width: 120px;
    height: var(--navbar-height);
    line-height: var(--navbar-height);
    text-align: center;
    font-weight: 300;
  }

  .navlink a {
    width: 100%;
    display: inline-block;
    height: 100%;
    color: white;
    text-decoration: none;
  }

  .navbar a:hover {
    background-color: #252525;
  }

  .navbar.opaque a:hover {
    background-color: #555;
  }

  .toggle-button {
    width: 1.5rem;
    height: 100%;
    fill: white;
    cursor: pointer;
    display: none;
  }

  .toggle-button.active {
    display: inline-block;
  }
</style>
